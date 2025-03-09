//
//  NavigationSequenceView.swift
//  NavigationSequence
//
//  Created by Dominic Thompson on 8/30/24.
//

import SwiftUI

/// A generalized view representation of a `NavigableSequence`.
///
/// `NavigationSequenceView` provides a structured way to navigate through a sequence of steps defined in a `NavigableSequence`.
/// It displays the content for each step and provides navigation handling, including validation and progress indicators.
///
/// This view is designed to be flexible and can be expanded upon to support additional customization, such as:
/// - Custom button text for each step.
/// - Additional actions or side effects triggered upon navigation.
/// - Styling and layout modifications tailored to specific use cases.
///
/// - Note: This view handles navigation transitions and step validation internally, making it easy to integrate into multi-step flows.
public struct NavigationSequenceView: View {
    @State var viewModel: NavigableSequence
    @State private var navigateToNextStep: Bool = false
    private let currentStepIndex: Int

    private let screenHeight = UIScreen.current?.bounds.height

    public init(viewModel: NavigableSequence, stepIndex: Int = 0) {
        self.viewModel = viewModel
        self.currentStepIndex = stepIndex
    }

    public var body: some View {
        ZStack {
            Rectangle()
                .fill(.secondaryBackground)
                .ignoresSafeArea(.all)

            viewModel.getViewForStep(idx: currentStepIndex)

            Button(action: {
                viewModel.canProceedToNextStep(idx: currentStepIndex) { canProceed in
                    if canProceed {
                        if viewModel.isFinalStep(idx: currentStepIndex) {
                            viewModel.finishedSequence()
                        } else {
                            navigateToNextStep.toggle()
                        }
                    }
                }
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .animation(.easeInOut, value: viewModel.isStepLoading(for: currentStepIndex))
                        .frame(height: 56)

                    if viewModel.isStepLoading(for: currentStepIndex) {
                        ProgressView()
                            .tint(.gray)
                    } else {
                        Text("Continue")
                            .tint(.white)
                            .font(.title3)
                            .fontWeight(.medium)
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom)
            .disabled(!viewModel.canSubmit(idx: currentStepIndex) || viewModel.isStepLoading(for: currentStepIndex))
            .frame(maxWidth: .infinity, maxHeight: screenHeight, alignment: .bottom)
            .ignoresSafeArea(.keyboard)
        }
        .alert("Unable to Continue", isPresented: .constant(!viewModel.getErrorMessage(for: currentStepIndex).isEmpty), actions: {
            Button(action: { viewModel.clearErrorMessage(for: currentStepIndex) }) {
                Text("Dismiss")
            }
        }, message: {
            Text(viewModel.getErrorMessage(for: currentStepIndex))
        })
        .if(!viewModel.isFinalStep(idx: currentStepIndex)) { view in
            view
                .navigationDestination(isPresented: $navigateToNextStep) {
                    NavigationSequenceView(viewModel: viewModel, stepIndex: currentStepIndex + 1)
                }
        }
    }
}
