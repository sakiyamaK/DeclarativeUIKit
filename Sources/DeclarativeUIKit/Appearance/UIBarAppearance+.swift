//
//  UIBarAppearance.swift
//  
//
//  Created by sakiyamaK on 2022/11/29.
//

import UIKit.UIBarAppearance

public extension UIBarAppearance {
    
    convenience init(configureBackgroundType: UIBarAppearanceConfigureBackgroundType) {
        self.init()
        self.configure(configureBackgroundType)
    }
    
    @discardableResult
    func apply(_ apply: ((Self) -> Void)) -> Self {
        apply(self)
        return self
    }
    
    @discardableResult
    func backgroundEffect(_ backgroundEffect: UIBlurEffect?) -> Self {
        self.backgroundEffect = backgroundEffect
        return self
    }

    @discardableResult
    func backgroundColor(_ backgroundColor: UIColor?) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }

    @discardableResult
    func backgroundImage(_ backgroundImage: UIImage?) -> Self {
        self.backgroundImage = backgroundImage
        return self
    }
    
    @discardableResult
    func backgroundImageContentMode(_ backgroundImageContentMode: UIView.ContentMode) -> Self {
        self.backgroundImageContentMode = backgroundImageContentMode
        return self
    }

    @discardableResult
    func shadowColor(_ shadowColor: UIColor?) -> Self {
        self.shadowColor = shadowColor
        return self
    }

    @discardableResult
    func shadowImage(_ shadowImage: UIImage?) -> Self {
        self.shadowImage = shadowImage
        return self
    }

    // @_disfavoredOverloadの仕様が確定したらサポート
//    @_disfavoredOverload
//    func configureWithDefaultBackground() -> Self {
//        self.configureWithDefaultBackground()
//        return self
//    }

    @discardableResult
    func configure(_ backgroundType: UIBarAppearanceConfigureBackgroundType) -> Self {
        switch backgroundType {
        case .default:
            self.configureWithDefaultBackground()
        case .opaqueBackground:
            self.configureWithOpaqueBackground()
        case .transparentBackground:
            self.configureWithTransparentBackground()
        }
        return self
    }
}
