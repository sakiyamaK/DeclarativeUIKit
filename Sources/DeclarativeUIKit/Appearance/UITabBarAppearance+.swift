//
//  UITabBarAppearance+.swift
//  
//
//  Created by sakiyamaK on 2022/11/29.
//

import UIKit.UITabBarAppearance

//@available(iOS 13.0, *)
//public extension UITabBarItemStateAppearance {
//
//    @discardableResult
//    func titleTextAttributes(_ titleTextAttributes: [NSAttributedString.Key : Any]) -> Self {
//        self.titleTextAttributes = titleTextAttributes
//        return self
//    }
//
//    @discardableResult
//    func titlePositionAdjustment(_ titlePositionAdjustment: UIOffset) -> Self {
//        self.titlePositionAdjustment = titlePositionAdjustment
//        return self
//    }
//
//    @discardableResult
//    func iconColor(_ iconColor: UIColor?) -> Self {
//        self.iconColor = iconColor
//        return self
//    }
//
//    @discardableResult
//    func badgePositionAdjustment(_ badgePositionAdjustment: UIOffset) -> Self {
//        self.badgePositionAdjustment = badgePositionAdjustment
//        return self
//    }
//
//    @discardableResult
//    func badgeBackgroundColor(_ badgeBackgroundColor: UIColor?) -> Self {
//        self.badgeBackgroundColor = badgeBackgroundColor
//        return self
//    }
//
//    @discardableResult
//    func badgeTextAttributes(_ badgeTextAttributes: [NSAttributedString.Key : Any]) -> Self {
//        self.badgeTextAttributes = badgeTextAttributes
//        return self
//    }
//
//    @discardableResult
//    func badgeTitlePositionAdjustment(_ badgeTitlePositionAdjustment: UIOffset) -> Self {
//        self.badgeTitlePositionAdjustment = badgeTitlePositionAdjustment
//        return self
//    }
//}

@available(iOS 13.0, *)
public extension UITabBarItemAppearance {
    
    @discardableResult
    func configure(DefaultFor style: UITabBarItemAppearance.Style) -> Self {
        self.configureWithDefault(for: style)
        return self
    }
}

// UITabBarItemStateAppearanceTypeを宣言的に設定するパラメータ

@available(iOS 13.0, *)
public extension UITabBarItemAppearance {
    @discardableResult
    func titleTextAttributes(_ titleTextAttributes: [NSAttributedString.Key : Any], appearanceTypes: [UITabBarItemStateAppearanceType]) -> Self {
        for appearanceType in appearanceTypes {
            switch appearanceType {
            case .normal:
                self.normal.titleTextAttributes = titleTextAttributes
            case .disabled:
                self.disabled.titleTextAttributes = titleTextAttributes
            case .focused:
                self.focused.titleTextAttributes = titleTextAttributes
            case .selected:
                self.selected.titleTextAttributes = titleTextAttributes
            }
        }
        return self
    }

    @discardableResult
    func titlePositionAdjustment(_ titlePositionAdjustment: UIOffset, appearanceTypes: [UITabBarItemStateAppearanceType]) -> Self {
        for appearanceType in appearanceTypes {
            switch appearanceType {
            case .normal:
                self.normal.titlePositionAdjustment = titlePositionAdjustment
            case .disabled:
                self.disabled.titlePositionAdjustment = titlePositionAdjustment
            case .focused:
                self.focused.titlePositionAdjustment = titlePositionAdjustment
            case .selected:
                self.selected.titlePositionAdjustment = titlePositionAdjustment
            }
        }
        return self
    }

    @discardableResult
    func iconColor(_ iconColor: UIColor?, appearanceTypes: [UITabBarItemStateAppearanceType]) -> Self {
        for appearanceType in appearanceTypes {
            switch appearanceType {
            case .normal:
                self.normal.iconColor = iconColor
            case .disabled:
                self.disabled.iconColor = iconColor
            case .focused:
                self.focused.iconColor = iconColor
            case .selected:
                self.selected.iconColor = iconColor
            }
        }
        return self
    }

    @discardableResult
    func badgePositionAdjustment(_ badgePositionAdjustment: UIOffset, appearanceTypes: [UITabBarItemStateAppearanceType]) -> Self {
        for appearanceType in appearanceTypes {
            switch appearanceType {
            case .normal:
                self.normal.badgePositionAdjustment = badgePositionAdjustment
            case .disabled:
                self.disabled.badgePositionAdjustment = badgePositionAdjustment
            case .focused:
                self.focused.badgePositionAdjustment = badgePositionAdjustment
            case .selected:
                self.selected.badgePositionAdjustment = badgePositionAdjustment
            }
        }
        return self
    }

    @discardableResult
    func badgeBackgroundColor(_ badgeBackgroundColor: UIColor?, appearanceTypes: [UITabBarItemStateAppearanceType]) -> Self {
        for appearanceType in appearanceTypes {
            switch appearanceType {
            case .normal:
                self.normal.badgeBackgroundColor = badgeBackgroundColor
            case .disabled:
                self.disabled.badgeBackgroundColor = badgeBackgroundColor
            case .focused:
                self.focused.badgeBackgroundColor = badgeBackgroundColor
            case .selected:
                self.selected.badgeBackgroundColor = badgeBackgroundColor
            }
        }
        return self
    }

    @discardableResult
    func badgeTextAttributes(_ badgeTextAttributes: [NSAttributedString.Key : Any], appearanceTypes: [UITabBarItemStateAppearanceType]) -> Self {
        for appearanceType in appearanceTypes {
            switch appearanceType {
            case .normal:
                self.normal.badgeTextAttributes = badgeTextAttributes
            case .disabled:
                self.disabled.badgeTextAttributes = badgeTextAttributes
            case .focused:
                self.focused.badgeTextAttributes = badgeTextAttributes
            case .selected:
                self.selected.badgeTextAttributes = badgeTextAttributes
            }
        }
        return self
    }

    @discardableResult
    func badgeTitlePositionAdjustment(_ badgeTitlePositionAdjustment: UIOffset, appearanceTypes: [UITabBarItemStateAppearanceType]) -> Self {
        for appearanceType in appearanceTypes {
            switch appearanceType {
            case .normal:
                self.normal.badgeTitlePositionAdjustment = badgeTitlePositionAdjustment
            case .disabled:
                self.disabled.badgeTitlePositionAdjustment = badgeTitlePositionAdjustment
            case .focused:
                self.focused.badgeTitlePositionAdjustment = badgeTitlePositionAdjustment
            case .selected:
                self.selected.badgeTitlePositionAdjustment = badgeTitlePositionAdjustment
            }
        }
        return self
    }
}

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
    func layoutAppearance(_ layoutAppearance: UITabBarItemAppearance, appearanceTypes: [UITabBarLayoutAppearanceType] = UITabBarLayoutAppearanceType.allCases) -> Self {
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
