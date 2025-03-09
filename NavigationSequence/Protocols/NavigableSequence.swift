//
//  NavigableSequence.swift
//  NavigationSequence
//
//  Created by Dominic Thompson on 8/30/24.
//

import SwiftUI

/// A protocol for managing a sequence of navigation steps in a SwiftUI application.
///
/// The NavigableSequence protocol defines the structure for a series of navigation steps with asynchronous
/// field validation and error handling.
///
/// - Note: Detailed documentation for methods is provided only in the public extension.
@MainActor public protocol NavigableSequence: AnyObject, Sendable {
    var steps: [NavigationStep] { get set }

    func canSubmit(idx: Int) -> Bool
    func canProceedToNextStep(idx: Int, completion: @escaping (Bool) -> Void)
    func getViewForStep(idx: Int) -> AnyView
    func finishedSequence()
}

public extension NavigableSequence {
    var finalStepIndex: Int {
        return steps.count - 1
    }

    /// Determines if the given index corresponds to the final navigation step.
    ///
    /// - Parameter idx: The index of the navigation step.
    /// - Returns: A Boolean value indicating whether the provided index is the final step.
    func isFinalStep(idx: Int) -> Bool {
        return idx == finalStepIndex
    }

    /// Checks if the provided index is valid for the navigation steps array.
    ///
    /// - Parameter idx: The index to validate.
    /// - Returns: A Boolean value indicating if the index falls within the valid range of steps.
    func isValidIndex(idx: Int) -> Bool {
        return idx >= 0 && idx < steps.count
    }

    /// Retrieves the error message for the navigation step at the specified index.
    ///
    /// - Parameter idx: The index of the navigation step.
    /// - Returns: The error message associated with the step, or an empty string if the index is invalid.
    func getErrorMessage(for idx: Int) -> String {
        guard isValidIndex(idx: idx) else { return "" }
        return steps[idx].errorMessage
    }

    /// Sets an error message for the navigation step at the specified index.
    ///
    /// - Parameters:
    ///   - message: The error message to set.
    ///   - idx: The index of the navigation step.
    func setErrorMessage(_ message: String, for idx: Int) {
        if isValidIndex(idx: idx) {
            steps[idx].errorMessage = message
        }
    }

    /// Clears any error message for the navigation step at the specified index.
    ///
    /// - Parameter idx: The index of the navigation step.
    func clearErrorMessage(for idx: Int) {
        if isValidIndex(idx: idx) {
            steps[idx].errorMessage = ""
        }
    }

    /// Checks whether the navigation step at the specified index is currently in a loading state.
    ///
    /// - Parameter idx: The index of the navigation step.
    /// - Returns: A Boolean value indicating whether the step is loading.
    func isStepLoading(for idx: Int) -> Bool {
        guard isValidIndex(idx: idx) else { return false }
        return steps[idx].isLoading
    }

    /// Updates the loading status for the navigation step at the specified index.
    ///
    /// - Parameters:
    ///   - isLoading: A Boolean indicating the new loading status.
    ///   - idx: The index of the navigation step.
    func setLoadingStatus(_ isLoading: Bool, for idx: Int) {
        if isValidIndex(idx: idx) {
            steps[idx].isLoading = isLoading
        }
    }

    /// Validates the fields of a given navigation step asynchronously.
    ///
    /// This method triggers field validation on the provided NavigationStepModel, updates the loading state,
    /// and handles error messaging based on the validation result.
    ///
    /// - Parameters:
    ///   - stepModel: The model representing the navigation step to be validated.
    ///   - idx: The index of the navigation step.
    ///   - completion: A closure that receives a Boolean value indicating whether the validation was successful.
    func validateNavigationStep(_ stepModel: NavigationStepModel, idx: Int, completion: @escaping (Bool) -> Void) {
        stepModel.validateFields { error in
            self.setLoadingStatus(false, for: idx)

            if let error = error {
                self.setErrorMessage(error, for: idx)
                completion(false)
            } else {
                completion(true)
            }
        }
    }
}
