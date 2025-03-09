//
//  ContentView.swift
//  NavigationSequence
//
//  Created by Dominic Thompson on 3/8/25.
//

import SwiftUI

struct SampleView: View {
    @State private var viewModel = SetupDeviceSequence()

    var body: some View {
        NavigationStack {
            NavigationSequenceView(viewModel: viewModel)
        }
    }
}

#Preview {
    SampleView()
}
