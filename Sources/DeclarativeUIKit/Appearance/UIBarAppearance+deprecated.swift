//
//  UIBarAppearance+deprecated.swift
//
//
//  Created by sakiyamaK on 2023/11/04.
//

import UIKit.UIBarAppearance

@available(iOS 13.0, *)
@available(*, deprecated, message: "imperative is deprecated. Use apply instead")
public extension UIBarAppearance {
    @discardableResult
    func imperative(_ imperative: ((Self) -> Void)) -> Self {
        imperative(self)
        return self
    }
}
