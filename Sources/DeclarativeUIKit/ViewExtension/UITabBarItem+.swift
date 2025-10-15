//
//  UITabBarItem+.swift
//  
//
//  Created by sakiyamaK on 2022/11/30.
//

import UIKit.UITabBarItem

public extension UITabBarItem {
    
    @discardableResult
    func selectedImage(_ selectedImage: UIImage?) -> Self {
        self.selectedImage = selectedImage
        return self
    }
    
    @discardableResult
    func badgeValue(_ badgeValue: String?) -> Self {
        self.badgeValue = badgeValue
        return self
    }

    @discardableResult
    func titlePositionAdjustment(_ titlePositionAdjustment: UIOffset) -> Self {
        self.titlePositionAdjustment = titlePositionAdjustment
        return self
    }
    
    @discardableResult
    func badgeColor(_ badgeColor: UIColor?) -> Self {
        self.badgeColor = badgeColor
        return self
    }

    @discardableResult
    func badgeTextAttributes(_ textAttributes: [NSAttributedString.Key : Any]?, for state: UIControl.State = .normal) -> Self {
        self.setBadgeTextAttributes(textAttributes, for: state)
        return self
    }
    
    @discardableResult
    func badgeTextAttributes(_ textAttributesBuilder: (() -> [NSAttributedString.Key : Any]?), for state: UIControl.State = .normal) -> Self {
        badgeTextAttributes(textAttributesBuilder(), for: state)
    }

    @discardableResult
    func badgeTextAttributes(for state: UIControl.State = .normal, _ textAttributesBuilder: (() -> [NSAttributedString.Key : Any]?)) -> Self {
        badgeTextAttributes(textAttributesBuilder(), for: state)
    }

    @discardableResult
    func standardAppearance(_ standardAppearance: UITabBarAppearance?) -> Self {
        self.standardAppearance = standardAppearance
        return self
    }

    @discardableResult
    func scrollEdgeAppearance(_ scrollEdgeAppearance: UITabBarAppearance?) -> Self {
        self.scrollEdgeAppearance = scrollEdgeAppearance
        return self
    }
    
    @discardableResult
    func appearance(appearanceTypes: [UITabBarAppearanceType] = UITabBarAppearanceType.allCases, _ appearanceBuilder: ((Self) -> UITabBarAppearance)) -> Self {
        let appearance = appearanceBuilder(self)
        for appearanceType in appearanceTypes {
            switch appearanceType {
            case .standard:
                self.standardAppearance = appearance
            case .scrollEdge:
                self.scrollEdgeAppearance = appearance
            }
        }
        return self
    }

    @discardableResult
    func appearance(appearanceTypes: [UITabBarAppearanceType] = UITabBarAppearanceType.allCases, _ appearanceBuilder: (() -> UITabBarAppearance)) -> Self {
        let appearance = appearanceBuilder()
        for appearanceType in appearanceTypes {
            switch appearanceType {
            case .standard:
                self.standardAppearance = appearance
            case .scrollEdge:
                if #available(iOS 15.0, *) {
                    self.scrollEdgeAppearance = appearance
                }
            }
        }
        return self
    }

}
