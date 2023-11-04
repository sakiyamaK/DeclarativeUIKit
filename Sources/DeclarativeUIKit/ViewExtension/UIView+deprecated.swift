//
//  UIView+deprecated.swift
//
//
//  Created by sakiyamaK on 2023/11/04.
//

import UIKit.UIView

@available(*, deprecated, message: "imperative is deprecated. Use apply instead")
public extension UIView {
    @discardableResult
    func imperative(_ imperative: ((Self) -> Void)) -> Self {
        imperative(self)
        return self
    }
    
    @discardableResult
    static func imperative(_ imperative: ((Self) -> Void)) -> Self {
        Self().apply(imperative)
    }
}
