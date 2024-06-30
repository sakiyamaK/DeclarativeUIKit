//
//  UIEdgeLayoutGuides.swift
//
//
//  Created by sakiyamaK on 2024/06/30.
//

import Foundation

@available(iOS 15.0, *)
public enum LayoutGuideType {
    public static var `default`: LayoutGuideType = .safeArea
    case safeArea, margins, readableContent, keyboard, normal
}

@available(iOS 15.0, *)
public struct UIEdgeLayoutGuides {
    public var top: LayoutGuideType
    public var leading: LayoutGuideType
    public var bottom: LayoutGuideType
    public var trailing: LayoutGuideType
    
    public init(top: LayoutGuideType = .default, leading: LayoutGuideType = .default, bottom: LayoutGuideType = .default, trailing: LayoutGuideType = .default) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
    }

    public init(all: LayoutGuideType) {
        self.init(top: all, leading: all, bottom: all, trailing: all)
    }

    public init(vertical: LayoutGuideType) {
        self.init(top: vertical, leading: .default, bottom: vertical, trailing: .default)
    }
    
    public init(horizontal: LayoutGuideType) {
        self.init(top: .default, leading: horizontal, bottom: .default, trailing: horizontal)
    }
}
