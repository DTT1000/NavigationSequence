//
//  LocationView.swift
//  NavigationSequence
//
//  Created by Dominic Thompson on 3/8/25.
//

import SwiftUI

struct LocationView: View {
    @State var viewModel: SetupDeviceSequence

    var body: some View {
        VStack(spacing: 14) {
            Image(systemName: "location")
                .resizable()
                .frame(width: 75, height: 75)
                .foregroundStyle(.blue)
                .fontWeight(.light)
                .padding(.bottom, 6)

            Text("Location Services")
                .fontWeight(.bold)
                .font(.largeTitle)

            Text("Location Services allows Maps and other apps and services like Find My to gather and use data indicating your approximate location.")
                .multilineTextAlignment(.center)
                .font(.system(size: 18))

            Spacer()

            Text("About Location Services & Privacy...")
                .foregroundStyle(.blue)
                .padding(.bottom, 95)
        }
        .padding(.horizontal, 18)
        .padding(.top, 75)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    LocationView(viewModel: .init())
}
