//
//  UIEdgeLayoutGuides.swift
//
//
//  Created by sakiyamaK on 2024/06/30.
//

import Foundation

@MainActor
public enum LayoutGuideType {
    public static let `default`: LayoutGuideType = .safeArea
    case safeArea, margins, readableContent, keyboard, normal
}

@MainActor
public struct UIEdgeLayoutGuides {
    public var top: LayoutGuideType
    public var leading: LayoutGuideType
    public var bottom: LayoutGuideType
    public var trailing: LayoutGuideType
    public var centerX: LayoutGuideType
    public var centerY: LayoutGuideType

    public init(
        top: LayoutGuideType = .default,
        leading: LayoutGuideType = .default,
        bottom: LayoutGuideType = .default,
        trailing: LayoutGuideType = .default,
        centerX: LayoutGuideType = .default,
        centerY: LayoutGuideType = .default
    ) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
        self.centerX = centerX
        self.centerY = centerY
    }

    public init(all: LayoutGuideType) {
        self.init(
            top: all,
            leading: all,
            bottom: all,
            trailing: all,
            centerX: all,
            centerY: all
        )
    }

    public init(vertical: LayoutGuideType) {
        self.init(
            top: vertical,
            leading: .default,
            bottom: vertical,
            trailing: .default,
            centerX: .default,
            centerY: .default
        )
    }
    
    public init(horizontal: LayoutGuideType) {
        self.init(
            top: .default,
            leading: horizontal,
            bottom: .default,
            trailing: horizontal,
            centerX: .default,
            centerY: .default
        )
    }
}
