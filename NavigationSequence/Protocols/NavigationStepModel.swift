//
//  NavigationStepModel.swift
//  NavigationSequence
//
//  Created by Dominic Thompson on 8/31/24.
//

import Foundation

/// A protocol that defines the interface for individual navigation step models in the application.
///
/// Each model that conforms to `NavigationStepModel` represents the data for a specific step in the navigation flow.
/// This enables the creation of various models, such as ``LocationViewModel`` or ``AutomaticUpdatesViewModel``, each containing
/// variables and logic pertinent to their respective page contexts.
///
/// - The `canSubmit` property indicates whether the step is ready for submission.
/// - The `validateFields` method performs asynchronous validation on the step's fields, returning an optional error message via a completion handler.
///
/// - Note: Conforming types should implement the validation logic as appropriate for their specific context.
@MainActor public protocol NavigationStepModel: AnyObject, Sendable {
    var canSubmit: Bool { get }

    func validateFields(completion: @escaping (String?) -> Void)
}
