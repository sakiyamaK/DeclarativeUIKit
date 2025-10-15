//
//  UITabBar+.swift
//  
//
//  Created by sakiyamaK on 2022/11/29.
//

import UIKit.UITabBar

public extension UITabBar {
    
    @discardableResult
    func delegate(_ delegate: UITabBarDelegate?) -> Self {
        self.delegate = delegate
        return self
    }

    @discardableResult
    func items(_ items: [UITabBarItem]?) -> Self {
        self.items = items
        return self
    }

    @discardableResult
    func selectedItem(_ selectedItem: UITabBarItem?) -> Self {
        self.selectedItem = selectedItem
        return self
    }
    
    @discardableResult
    func items(_ items: [UITabBarItem]?, animated: Bool) -> Self {
        self.setItems(items, animated: animated)
        return self
    }
    
    @discardableResult
    func barTintColor(_ barTintColor: UIColor?) -> Self {
        self.barTintColor = barTintColor
        return self
    }

    @discardableResult
    func unselectedItemTintColor(_ unselectedItemTintColor: UIColor?) -> Self {
        self.unselectedItemTintColor = unselectedItemTintColor
        return self
    }

    @discardableResult
    func backgroundImage(_ backgroundImage: UIImage?) -> Self {
        self.backgroundImage = backgroundImage
        return self
    }

    @discardableResult
    func selectionIndicatorImage(_ selectionIndicatorImage: UIImage?) -> Self {
        self.selectionIndicatorImage = selectionIndicatorImage
        return self
    }

    @discardableResult
    func shadowImage(_ shadowImage: UIImage?) -> Self {
        self.shadowImage = shadowImage
        return self
    }

    @discardableResult
    func itemPositioning(_ itemPositioning: UITabBar.ItemPositioning) -> Self {
        self.itemPositioning = itemPositioning
        return self
    }

    @discardableResult
    func itemWidth(_ itemWidth: CGFloat) -> Self {
        self.itemWidth = itemWidth
        return self
    }

    @discardableResult
    func itemSpacing(_ itemSpacing: CGFloat) -> Self {
        self.itemSpacing = itemSpacing
        return self
    }

    @discardableResult
    func barStyle(_ barStyle: UIBarStyle) -> Self {
        self.barStyle = barStyle
        return self
    }

    @discardableResult
    func isTranslucent(_ isTranslucent: Bool) -> Self {
        self.isTranslucent = isTranslucent
        return self
    }

    @discardableResult
    func standardAppearance(_ standardAppearance: UITabBarAppearance) -> Self {
        self.standardAppearance = standardAppearance
        return self
    }

    @discardableResult
    func scrollEdgeAppearance(_ scrollEdgeAppearance: UITabBarAppearance?) -> Self {
        self.scrollEdgeAppearance = scrollEdgeAppearance
        return self
    }
    
    @discardableResult
    func tabBarAppearance(standard: UITabBarAppearance, scrollEdge: UITabBarAppearance?) -> Self {
        self.standardAppearance = standardAppearance
        self.scrollEdgeAppearance = scrollEdgeAppearance
        return self
    }

    @discardableResult
    func tabBarAppearance(appearanceTypes: [UITabBarAppearanceType] = UITabBarAppearanceType.allCases, _ appearanceBuilder: ((Self) -> UITabBarAppearance)) -> Self {
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
    func tabBarAppearance(appearanceTypes: [UITabBarAppearanceType] = UITabBarAppearanceType.allCases, _ appearanceBuilder: (() -> UITabBarAppearance)) -> Self {
        let appearance = appearanceBuilder()
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

}

