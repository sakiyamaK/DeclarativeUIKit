//
//  UITabBarAppearance+.swift
//  
//
//  Created by sakiyamaK on 2022/11/29.
//

import UIKit.UITabBarAppearance

@available(iOS 13.0, *)
public extension UITabBarAppearance {

    @discardableResult
    func stackedLayoutAppearance(_ stackedLayoutAppearance: UITabBarItemAppearance) -> Self {
        self.stackedLayoutAppearance = stackedLayoutAppearance
        return self
    }

    @discardableResult
    func inlineLayoutAppearance(_ inlineLayoutAppearance: UITabBarItemAppearance) -> Self {
        self.inlineLayoutAppearance = inlineLayoutAppearance
        return self
    }
    
    @discardableResult
    func compactInlineLayoutAppearance(_ compactInlineLayoutAppearance: UITabBarItemAppearance) -> Self {
        self.compactInlineLayoutAppearance = compactInlineLayoutAppearance
        return self
    }

    @discardableResult
    func selectionIndicatorTintColor(_ selectionIndicatorTintColor: UIColor?) -> Self {
        self.selectionIndicatorTintColor = selectionIndicatorTintColor
        return self
    }

    @discardableResult
    func selectionIndicatorImage(_ selectionIndicatorImage: UIImage?) -> Self {
        self.selectionIndicatorImage = selectionIndicatorImage
        return self
    }

    @discardableResult
    func stackedItemPositioning(_ stackedItemPositioning: UITabBar.ItemPositioning) -> Self {
        self.stackedItemPositioning = stackedItemPositioning
        return self
    }

    @discardableResult
    func stackedItemWidth(_ stackedItemWidth: CGFloat) -> Self {
        self.stackedItemWidth = stackedItemWidth
        return self
    }

    @discardableResult
    func stackedItemSpacing(_ stackedItemSpacing: CGFloat) -> Self {
        self.stackedItemSpacing = stackedItemSpacing
        return self
    }
}

@available(iOS 13.0, *)
public extension UITabBarAppearance {    
    @discardableResult
    func tabBarItemAppearance(appearanceTypes: [UITabBarItemAppearanceType] = UITabBarItemAppearanceType.allCases, _ layoutAppearanceBuilder: (() -> UITabBarItemAppearance)) -> Self {
        let layoutAppearance = layoutAppearanceBuilder()
        for appearanceType in appearanceTypes {
            switch appearanceType {
            case .stackedLayoutAppearance:
                self.stackedLayoutAppearance = layoutAppearance
            case .inlineLayoutAppearance:
                self.inlineLayoutAppearance = layoutAppearance
            case .compactInlineLayoutAppearance:
                self.compactInlineLayoutAppearance = layoutAppearance
            }
        }
        return self
    }
}
