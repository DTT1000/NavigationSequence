//
//  NavigableStep.swift
//  NavigationSequence
//
//  Created by Dominic Thompson on 8/30/24.
//

import SwiftUI

/// A protocol defining a step within a navigable sequence.
///
/// `NavigableStep` is designed for use with enums that represent distinct steps in a structured navigation flow, such as ``SetupDevicePage``.
///
/// - Note: This protocol is commonly used with `NavigableSequence` to facilitate step-based navigation.
public protocol NavigableStep: CaseIterable, Identifiable, Hashable, Sendable {
    var id: Int { get }
}
