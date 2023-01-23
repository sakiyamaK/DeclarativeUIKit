//
//  UITabBarController+.swift
//  DeclarativeUIKitDemo
//
//  Created by sakiyamaK on 2022/12/04.
//

import UIKit
import DeclarativeUIKit

extension UITabBarController {
    
    static func rootTabBarController(count: Int = 5) -> UITabBarController {
        return UITabBarController.viewControllers {
            Range(1...count).compactMap { number -> UIViewController in
                UIViewController().apply {
                    $0.view.backgroundColor = .white
                    $0.declarative {
                        UILabel(number.description)
                            .center()
                    }
                }.tabBarItem(
                    UITabBarItem(tabBarSystemItem: .init(rawValue: number) ?? .mostRecent, tag: number)
                        .badgeValue(10.description)
                )
            }
        }
        .tabBarAppearance {
            UITabBarAppearance(configureBackgroundType: .default)
                .backgroundColor(.blue)
                .tabBarItemAppearance {
                    UITabBarItemAppearance()
                        .titleTextAttributes([.foregroundColor: UIColor.red, .backgroundColor: UIColor.white])
                        .iconColor(.green, appearanceTypes: [.normal])
                        .iconColor(.red, appearanceTypes: [.selected])
                        .badgeBackgroundColor(.brown)
                }
        }
    }
}
