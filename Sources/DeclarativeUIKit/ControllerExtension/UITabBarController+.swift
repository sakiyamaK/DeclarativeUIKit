//
//  UITabBarController+.swift
//  
//
//  Created by sakiyamaK on 2022/11/28.
//

import UIKit.UITabBarController

//MARK: - Declarative method
public extension UITabBarController {
    
    static func viewControllers(_ viewControllers: [UIViewController]) -> UITabBarController {
        UITabBarController().viewControllers(viewControllers)
    }

    static func viewControllers(@ArrayUIViewControllerBuilder _ builder: () -> [UIViewController]) -> UITabBarController {
        UITabBarController().viewControllers(builder())
    }
    
    @discardableResult
    func viewControllers(_ viewControllers: [UIViewController]) -> Self {
        self.viewControllers = viewControllers
        return self
    }
    
    @discardableResult
    func viewControllers(@ArrayUIViewControllerBuilder _ builder: () -> [UIViewController]) -> Self {
        self.viewControllers(builder())
        return self
    }
    
    @discardableResult
    func viewControllers(_ viewControllers: [UIViewController]?, animated: Bool) -> Self {
        self.setViewControllers(viewControllers, animated: animated)
        return self
    }
    
    @discardableResult
    func viewControllers(@ArrayUIViewControllerBuilder _ builder: () -> [UIViewController], animated: Bool) -> Self {
        self.viewControllers(builder(), animated: animated)
        return self
    }

    @discardableResult
    func viewControllers(animated: Bool, _ viewControllers: [UIViewController]?) -> Self {
        self.setViewControllers(viewControllers, animated: animated)
        return self
    }
    
    @discardableResult
    func viewControllers(animated: Bool, @ArrayUIViewControllerBuilder _ builder: () -> [UIViewController]) -> Self {
        self.viewControllers(builder(), animated: animated)
        return self
    }
    
    @discardableResult
    func selectedViewController(_ selectedViewController: UIViewController?) -> Self {
        self.selectedViewController = selectedViewController
        return self
    }

    @discardableResult
    func selectedIndex(_ selectedIndex: Int) -> Self {
        self.selectedIndex = selectedIndex
        return self
    }

    @discardableResult
    func customizableViewControllers(_ customizableViewControllers: [UIViewController]?) -> Self {
        self.customizableViewControllers = customizableViewControllers
        return self
    }
    
    @discardableResult
    func customizableViewControllers(@ArrayUIViewControllerBuilder _ builder: () -> [UIViewController]) -> Self {
        self.customizableViewControllers(builder())
        return self
    }

    @discardableResult
    func delegate(_ delegate: UITabBarControllerDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
}

@available(iOS 13.0, *)
public extension UITabBarController {
    @discardableResult
    func tabBarAppearance(appearanceTypes: [UITabBarAppearanceType] = UITabBarAppearanceType.allCases, _ tabBarAppearanceBuilder: (() -> UITabBarAppearance)) -> Self {
        self.tabBar.tabBarAppearance(appearanceTypes: appearanceTypes) { _ in tabBarAppearanceBuilder() }
        return self
    }
}
