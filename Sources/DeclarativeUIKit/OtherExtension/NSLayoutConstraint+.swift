//
//  NSLayoutConstraint+.swift
//  
//
//  Created by sakiyamaK on 2024/06/30.
//

import UIKit

public extension NSLayoutConstraint {

    @resultBuilder
    struct ActivateBuilder {
        public static func buildBlock(_ constraints: NSLayoutConstraint...) -> [NSLayoutConstraint] {
            constraints
        }
        public static func buildBlock(_ constraints: NSLayoutConstraint?...) -> [NSLayoutConstraint] {
            constraints.compactMap({$0})
        }
    }

    static func activate(@ActivateBuilder builder: () -> [NSLayoutConstraint]) {
        let constraints = builder()
        constraints.compactMap({ $0.firstItem as? UIView }).forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        constraints.compactMap({ $0.secondItem as? UIView }).forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate(constraints)
    }

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
