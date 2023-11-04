//
//  UIAlertController+deprecated.swift
//  
//
//  Created by sakiyamaK on 2023/11/04.
//

import UIKit.UIAlertController

@available(*, deprecated, message: "imperative is deprecated. Use apply instead")
public extension UIAlertController {
    @discardableResult
    func imperative(_ imperative: ((Self) -> Void)) -> Self {
        imperative(self)
        return self
    }
}
