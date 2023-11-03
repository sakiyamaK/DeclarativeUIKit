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
@available(iOS 13.0, *)
extension UIBarAppearance: Applyable {}
extension String: Applyable {}
extension NSString: Applyable {}
@available(iOS 15.0, *)
extension AttributedString: Applyable {}
extension NSAttributedString: Applyable {}
