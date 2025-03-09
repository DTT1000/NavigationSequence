//
//  NavigationStep.swift
//  NavigationSequence
//
//  Created by Dominic Thompson on 8/30/24.
//

import SwiftUI

public struct NavigationStep: Hashable, Sendable {
    public let wrappedValue: any NavigableStep
    public var errorMessage: String = ""
    public var isLoading: Bool = false
    
    public init<T: NavigableStep>(_ value: T) {
        self.wrappedValue = value
    }
    
    public static func == (lhs: NavigationStep, rhs: NavigationStep) -> Bool {
        return lhs.wrappedValue.id == rhs.wrappedValue.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(wrappedValue.id)
    }
}
