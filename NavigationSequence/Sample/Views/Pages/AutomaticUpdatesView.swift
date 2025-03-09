//
//  AutomaticUpdatesView.swift
//  NavigationSequence
//
//  Created by Dominic Thompson on 3/8/25.
//

import SwiftUI

struct AutomaticUpdatesView: View {
    @State var viewModel: SetupDeviceSequence

    var body: some View {
        VStack(spacing: 14) {
            ZStack {
                Image(systemName: "arrow.trianglehead.2.clockwise")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .rotationEffect(.degrees(90))
                    .opacity(0.5)
                    .foregroundStyle(.blue)
                    .fontWeight(.light)
                    .padding(.bottom, 6)

                Image(systemName: "gear")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                    .foregroundStyle(.blue)
                    .fontWeight(.bold)
                    .offset(y: -2)
            }

            Text("Keep Your iPhone Up to Date")
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
                .font(.largeTitle)
                .padding(.horizontal, 20)

            Text("Get the latest features, security, and improvemtns by updating iOS automatically.")
                .multilineTextAlignment(.center)
                .font(.system(size: 18))
                .padding(.horizontal)
                .padding(.vertical, 6)

            Text("You will receive a notification before updates are installed, and can choose other options in Settings.")
                .multilineTextAlignment(.center)
                .font(.system(size: 18))
                .padding(.horizontal)
        }
        .padding(.horizontal, 18)
        .padding(.top, 75)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    AutomaticUpdatesView(viewModel: .init())
}
