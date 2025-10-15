//
//  UITabBarItemAppearance+.swift
//  
//
//  Created by sakiyamaK on 2022/12/03.
//

import UIKit.UITabBarAppearance

public extension UITabBarItemAppearance {
    
    convenience init(configureWithDefaultFor: UITabBarItemAppearance.Style) {
        self.init()
        self.configure(configureWithDefaultFor)
    }

    
    @discardableResult
    func configure(_ defaultFor: UITabBarItemAppearance.Style) -> Self {
        self.configureWithDefault(for: defaultFor)
        return self
    }
}


public extension UITabBarItemAppearance {
    @discardableResult
    func titleTextAttributes(_ titleTextAttributes: [NSAttributedString.Key : Any], appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self {
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
    func titleTextAttributes(_ titleTextAttributesBuilder: @escaping (() -> [NSAttributedString.Key : Any]), appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self {
        self.titleTextAttributes(titleTextAttributesBuilder(), appearanceTypes: appearanceTypes)
    }
    
    @discardableResult
    func titleTextAttributes(appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases, _ titleTextAttributesBuilder: @escaping (() -> [NSAttributedString.Key : Any])) -> Self {
        self.titleTextAttributes(titleTextAttributesBuilder(), appearanceTypes: appearanceTypes)
    }

    @discardableResult
    func titlePositionAdjustment(_ titlePositionAdjustment: UIOffset, appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self {
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
    func titlePositionAdjustment(_ titlePositionAdjustmentBuilder: (() -> UIOffset), appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self {
        titlePositionAdjustment(titlePositionAdjustmentBuilder(), appearanceTypes: appearanceTypes)
    }

    @discardableResult
    func titlePositionAdjustment(appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases, _ titlePositionAdjustmentBuilder: (() -> UIOffset)) -> Self {
        titlePositionAdjustment(titlePositionAdjustmentBuilder(), appearanceTypes: appearanceTypes)
    }

    @discardableResult
    func iconColor(_ iconColor: UIColor?, appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self {
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
    func iconColor(_ iconColorBuilder: (() -> UIColor?), appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self {
        iconColor(iconColorBuilder(), appearanceTypes: appearanceTypes)
    }

    @discardableResult
    func iconColor(appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases, _ iconColorBuilder: (() -> UIColor?)) -> Self {
        iconColor(iconColorBuilder(), appearanceTypes: appearanceTypes)
    }

    @discardableResult
    func badgePositionAdjustment(_ badgePositionAdjustment: UIOffset, appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self {
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
    func badgePositionAdjustment(_ badgePositionAdjustmentBuilder: (() -> UIOffset), appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self {
        badgePositionAdjustment(badgePositionAdjustmentBuilder(), appearanceTypes: appearanceTypes)
    }

    @discardableResult
    func badgePositionAdjustment(appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases, _ badgePositionAdjustmentBuilder: (() -> UIOffset)) -> Self {
        badgePositionAdjustment(badgePositionAdjustmentBuilder(), appearanceTypes: appearanceTypes)
    }

    @discardableResult
    func badgeBackgroundColor(_ badgeBackgroundColor: UIColor?, appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self {
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
    func badgeBackgroundColor(_ badgeBackgroundColorBuilder: (() -> UIColor?), appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self {
        self.badgeBackgroundColor(badgeBackgroundColorBuilder(), appearanceTypes: appearanceTypes)
    }

    @discardableResult
    func badgeBackgroundColor(appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases, _ badgeBackgroundColorBuilder: (() -> UIColor?)) -> Self {
        self.badgeBackgroundColor(badgeBackgroundColorBuilder(), appearanceTypes: appearanceTypes)
    }

    @discardableResult
    func badgeTextAttributes(_ badgeTextAttributes: [NSAttributedString.Key : Any], appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self {
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
    func badgeTextAttributes(_ badgeTextAttributesBuilder: (() -> [NSAttributedString.Key : Any]), appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self {
        self.badgeTextAttributes(badgeTextAttributesBuilder(), appearanceTypes: appearanceTypes)
    }

    @discardableResult
    func badgeTextAttributes(appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases, _ badgeTextAttributesBuilder: (() -> [NSAttributedString.Key : Any])) -> Self {
        self.badgeTextAttributes(badgeTextAttributesBuilder(), appearanceTypes: appearanceTypes)
    }

    @discardableResult
    func badgeTitlePositionAdjustment(_ badgeTitlePositionAdjustment: UIOffset, appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self {
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
    
    @discardableResult
    func badgeTitlePositionAdjustment(_ badgeTitlePositionAdjustmentBuilder: (() -> UIOffset), appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self {
        badgeTitlePositionAdjustment(badgeTitlePositionAdjustmentBuilder(), appearanceTypes: appearanceTypes)
    }
    
    @discardableResult
    func badgeTitlePositionAdjustment(appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases, _ badgeTitlePositionAdjustmentBuilder: (() -> UIOffset)) -> Self {
        badgeTitlePositionAdjustment(badgeTitlePositionAdjustmentBuilder(), appearanceTypes: appearanceTypes)
    }

}
