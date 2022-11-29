//
//  HelperUITabBarAppearance.swift
//  
//
//  Created by sakiyamaK on 2022/11/30.
//

import UIKit.UITabBarAppearance

public enum UITabBarItemStateAppearanceType: CaseIterable {
    case normal, selected, disabled, focused
}

public enum UITabBarAppearanceType: CaseIterable {
    case standard, scrollEdge
}

public enum UITabBarLayoutAppearanceType: CaseIterable {
    case stackedLayoutAppearance, inlineLayoutAppearance, compactInlineLayoutAppearance
}
