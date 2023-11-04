//
//  UIBezierPath+deprecated.swift
//  
//
//  Created by sakiyamaK on 2023/11/04.
//

import UIKit.UIBezierPath

@available(*, deprecated, message: "imperative is deprecated. Use apply instead")
public extension UIBezierPath {
    @discardableResult
    static func imperative(_ imperative: ((Self) -> Void)) -> Self {
        Self().apply(imperative)
    }

    @discardableResult
    func imperative(_ imperative: (Self) -> Void) -> Self {
        imperative(self)
        return self
    }

}
