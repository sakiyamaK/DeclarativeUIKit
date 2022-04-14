//
//  UIActivityIndicatorView+.swift
//  
//
//  Created by sakiyamaK on 2022/04/14.
//

import UIKit

//MARK: - Declarative method
public extension UIActivityIndicatorView {

    @discardableResult
    func hidesWhenStopped(_ hidesWhenStopped: Bool) -> Self {
        self.hidesWhenStopped = hidesWhenStopped
        return self
    }
    
    @discardableResult
    func color(_ color: UIColor) -> Self {
        self.color = color
        return self
    }
    
    @discardableResult
    func style(_ style: Style) -> Self {
        self.style = style
        return self
    }
}
