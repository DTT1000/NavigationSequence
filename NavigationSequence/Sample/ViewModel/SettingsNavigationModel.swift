//
//  SettingsNavigationModel.swift
//  NavigationSequence
//
//  Created by Dominic Thompson on 3/8/25.
//

import SwiftUI

@Observable final class SetupDeviceSequence: NavigableSequence {
    var steps: [NavigationStep] = SetupDevicePage.allCases.map({ NavigationStep($0) })

    var locationModel: LocationViewModel = .init()
    var siriModel: SiriViewModel = .init()
    var automaticUpdatesModel: AutomaticUpdatesViewModel = .init()

    func canSubmit(idx: Int) -> Bool {
        guard isValidIndex(idx: idx) else { return false }

        switch steps[idx].wrappedValue as? SetupDevicePage {
            case .location:
                return locationModel.canSubmit
            case .siri:
                return siriModel.canSubmit
            case .automaticUpdates:
                return automaticUpdatesModel.canSubmit
            case .none:
                return false
        }
    }

    func canProceedToNextStep(idx: Int, completion: @escaping (Bool) -> Void) {
        guard isValidIndex(idx: idx) else {
            completion(false)
            return
        }

        setLoadingStatus(true, for: idx)

        switch steps[idx].wrappedValue as? SetupDevicePage {
            case .location:
                validateNavigationStep(locationModel, idx: idx, completion: completion)
            case .siri:
                validateNavigationStep(siriModel, idx: idx, completion: completion)
            case .automaticUpdates:
                validateNavigationStep(automaticUpdatesModel, idx: idx, completion: completion)
            default:
                setLoadingStatus(false, for: idx)
                completion(false)
        }
    }

    func getViewForStep(idx: Int) -> AnyView {
        guard isValidIndex(idx: idx) else { return AnyView(EmptyView()) }

        switch steps[idx].wrappedValue as? SetupDevicePage {
            case .location:
                return AnyView(LocationView(viewModel: self))
            case .siri:
                return AnyView(SiriView(viewModel: self))
            case .automaticUpdates:
                return AnyView(AutomaticUpdatesView(viewModel: self))
            default:
                return AnyView(EmptyView())
        }
    }

    func finishedSequence() {
        setLoadingStatus(true, for: finalStepIndex)
    }
}

enum SetupDevicePage: Int, NavigableStep {
    case location = 0
    case siri = 1
    case automaticUpdates = 2

    var id: Int {
        return rawValue
    }
}
