//
//  UIView+Environment.swift
//  DeclarativeUIKit
//
//  Created by sakiyamaK on 2025/08/06.
//

import UIKit
import SwiftUICore

public extension UIView {

    @discardableResult
    func environment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>, _ value: V) -> Self {
        var newValues = self.environmentValues
        newValues[ObjectIdentifier(keyPath)] = value
        self.environmentValues = newValues
        return self
    }

    func readEnvironment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>) -> V {
        if let value = self.environmentValues[ObjectIdentifier(keyPath)] as? V {
            value
        } else if let superview = self.superview {
            superview.readEnvironment(keyPath)
        } else {
            EnvironmentValues()[keyPath: keyPath]
        }
    }
}
