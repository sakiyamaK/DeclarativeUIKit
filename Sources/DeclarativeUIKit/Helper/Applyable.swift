//
//  Applyable.swift
//  
//
//  Created by sakiyamaK on 2023/01/23.
//

import UIKit

// MARK: - Applyable
public protocol Applyable {}
extension Applyable {
    @discardableResult
    public func apply(_ closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }    
}

extension UIView: Applyable {}
extension UIBezierPath: Applyable {}
extension UIViewController: Applyable {}
extension UIBarAppearance: Applyable {}
extension String: Applyable {}
extension NSString: Applyable {}
extension AttributedString: Applyable {}
extension NSAttributedString: Applyable {}
extension NSLayoutConstraint: Applyable {}
