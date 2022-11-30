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

    @available(iOS 13.0, *)
    @discardableResult
    func standardAppearance(_ standardAppearance: UITabBarAppearance?) -> Self {
        self.standardAppearance = standardAppearance
        return self
    }

    @available(iOS 15.0, *)
    @discardableResult
    func scrollEdgeAppearance(_ scrollEdgeAppearance: UITabBarAppearance?) -> Self {
        self.scrollEdgeAppearance = scrollEdgeAppearance
        return self
    }
}
