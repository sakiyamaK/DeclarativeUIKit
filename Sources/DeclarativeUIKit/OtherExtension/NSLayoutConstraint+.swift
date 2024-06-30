//
//  NSLayoutConstraint+.swift
//  
//
//  Created by sakiyamaK on 2024/06/30.
//

import UIKit

public extension NSLayoutConstraint {
    @discardableResult
    func isActive(_ isActive: Bool) -> Self {
        self.isActive = isActive
        return self
    }
    
    @discardableResult
    func priority(_ priority: UILayoutPriority) -> Self {
        self.priority = priority
        return self
    }
    
    @discardableResult
    func constant(_ constant: CGFloat) -> Self {
        self.constant = constant
        return self
    }

    @discardableResult
    func shouldBeArchived(_ shouldBeArchived: Bool) -> Self {
        self.shouldBeArchived = shouldBeArchived
        return self
    }
}
