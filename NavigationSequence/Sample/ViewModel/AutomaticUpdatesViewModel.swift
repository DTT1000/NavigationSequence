//
//  LocationViewModel 2.swift
//  NavigationSequence
//
//  Created by Dominic Thompson on 3/8/25.
//

import SwiftUI

@Observable class AutomaticUpdatesViewModel: NavigationStepModel {
    var enableAutomaticUpdates: Bool = false

    var canSubmit: Bool {
        return true
    }

    func validateFields(completion: @escaping (String?) -> Void) {
        completion(nil)
    }
}
