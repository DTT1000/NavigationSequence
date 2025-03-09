//
//  LocationView 2.swift
//  NavigationSequence
//
//  Created by Dominic Thompson on 3/8/25.
//

import SwiftUI

struct SiriView: View {
    @State var viewModel: SetupDeviceSequence

    var body: some View {
        VStack(spacing: 14) {
            Image("Siri")
                .resizable()
                .frame(width: 75, height: 75)
                .foregroundStyle(.blue)
                .fontWeight(.light)
                .padding(.bottom, 6)

            Text("Siri")
                .fontWeight(.bold)
                .font(.largeTitle)

            Text("Siri helps you get things done just by asking. Siri can even make suggestions before you ask in apps and keyboards.")
                .multilineTextAlignment(.center)
                .font(.system(size: 18))
                .padding(.bottom, 12)

            Text("To use Siri, press and hold the side button or say \"Hey Siri\" anytime.")
                .multilineTextAlignment(.center)
                .font(.system(size: 18))

            Spacer()

            Text("About Siri and Privacy...")
                .foregroundStyle(.blue)
                .padding(.bottom, 95)
        }
        .padding(.horizontal, 18)
        .padding(.top, 75)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}
