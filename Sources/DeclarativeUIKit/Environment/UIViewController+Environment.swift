//
//  UIViewController+Environment.swift
//  DeclarativeUIKit
//
//  Created by sakiyamaK on 2025/08/06.
//
import UIKit
import SwiftUICore

public extension UIViewController {

    @discardableResult
    func environment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>, _ value: V) -> Self {
        var newValues = self.view.environmentValues
        newValues[ObjectIdentifier(keyPath)] = value
        self.view.environmentValues = newValues
        return self
    }
}
