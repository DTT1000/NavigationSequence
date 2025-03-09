//
//  SiriViewModel.swift
//  NavigationSequence
//
//  Created by Dominic Thompson on 3/8/25.
//

import SwiftUI

@Observable class SiriViewModel: NavigationStepModel {
    var enableSiri: Bool = false

    var canSubmit: Bool {
        return true
    }

    func validateFields(completion: @escaping (String?) -> Void) {
        completion(nil)
    }
}
