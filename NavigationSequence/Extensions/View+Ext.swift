//
//  View+Ext.swift
//  NavigationSequence
//
//  Created by Dominic Thompson on 8/13/24.
//

import SwiftUI

public extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
