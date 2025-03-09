//
//  ShapeStyle+Ext.swift
//  NavigationSequence
//
//  Created by Dominic Thompson on 7/4/24.
//

import SwiftUI

public extension ShapeStyle where Self == Color {
    static var systemBackground: Color { .init(uiColor: UIColor.systemBackground) }
    
    static var secondaryBackground: Color { .init(uiColor: UIColor.secondarySystemBackground) }
}
