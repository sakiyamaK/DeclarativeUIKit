//
//  UIView+Environment.swift
//  DeclarativeUIKit
//
//  Created by sakiyamaK on 2025/08/06.
//

import UIKit
import SwiftUICore

final class HelperReadEnvironmentView<V, T: UIView>: UIView {
    private let keyPath: WritableKeyPath<EnvironmentValues, V>
    private(set) var readEnvironment: ((T, V) -> Void)?

    init(
        keyPath: WritableKeyPath<EnvironmentValues, V>,
        readEnvironment: ((T, V) -> Void)?
    ) {
        self.keyPath = keyPath
        self.readEnvironment = readEnvironment
        super.init(frame: .zero)
        self.isHidden = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        // superviewだと型が合わせられない
        if window != nil, let superview = superview as? T {
            let value: V = readEnvironmentValue(keyPath: keyPath)
            readEnvironment?(superview, value)
            readEnvironment = nil
            removeFromSuperview()
        }
    }

    private func readEnvironmentValue(keyPath: WritableKeyPath<EnvironmentValues, V>) -> V {
        if let value = self.environmentValues[ObjectIdentifier(keyPath)] as? V {
            value
        } else if let superview = self.superview {
            superview.readEnvironment(keyPath)
        } else {
            EnvironmentValues()[keyPath: keyPath]
        }
    }

}

// customSpacingと違ってonAppearクロージャで自身の型を送る必要があるためprotocol extensionで実装している
public protocol ReadEnvironmentable {}
public extension ReadEnvironmentable where Self: UIView {
    @discardableResult
    func readEnvironment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>, _ readEnvironment: @escaping (Self, V) -> Void) -> Self {
        self.zStack {
            HelperReadEnvironmentView(keyPath: keyPath, readEnvironment: readEnvironment)
        }
    }
}
extension UIView: ReadEnvironmentable {}


public extension UIView {
    private struct AssociatedKeys {
        static var environmentValues: UInt8 = 0
    }

    fileprivate var environmentValues: [ObjectIdentifier: Any] {
        get {
            objc_getAssociatedObject(self, &AssociatedKeys.environmentValues) as? [ObjectIdentifier: Any] ?? [:]
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.environmentValues, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    @discardableResult
    func environment<K: UIKitEnvironmentKey>(_ keyPath: K.Type, _ value: K.Value) -> Self {
        var newValues = self.environmentValues
        newValues[ObjectIdentifier(keyPath)] = value
        self.environmentValues = newValues
        return self
    }

    func readEnvironment<K: UIKitEnvironmentKey>(_ keyPath: K.Type) -> K.Value {
        if let value = self.environmentValues[ObjectIdentifier(keyPath)] as? K.Value {
            value
        } else if let superview = self.superview {
            superview.readEnvironment(keyPath)
        } else {
            K.defaultValue
        }
    }
}

public extension UIView {

    @discardableResult
    func environment<K: EnvironmentKey>(_ keyPath: K.Type, _ value: K.Value) -> Self {
        var newValues = self.environmentValues
        newValues[ObjectIdentifier(keyPath)] = value
        self.environmentValues = newValues
        return self
    }

    @discardableResult
    func environment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>, _ value: V) -> Self {
        var newValues = self.environmentValues
        newValues[ObjectIdentifier(keyPath)] = value
        self.environmentValues = newValues
        return self
    }


    func readEnvironment<K: EnvironmentKey>(_ keyPath: K.Type) -> K.Value {
        if let value = self.environmentValues[ObjectIdentifier(keyPath)] as? K.Value {
            value
        } else if let superview = self.superview {
            superview.readEnvironment(keyPath)
        } else {
            K.defaultValue
        }
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

public extension UIViewController {
    @discardableResult
    func environment<K: UIKitEnvironmentKey>(_ keyPath: K.Type, _ value: K.Value) -> Self {
        var newValues = self.view.environmentValues
        newValues[ObjectIdentifier(keyPath)] = value
        self.view.environmentValues = newValues
        return self
    }

    @discardableResult
    func environment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>, _ value: V) -> Self {
        var newValues = self.view.environmentValues
        newValues[ObjectIdentifier(keyPath)] = value
        self.view.environmentValues = newValues
        return self
    }
//    @discardableResult
//    func environment<K: UIKitEnvironmentKey>(_ keyPath: K.Type, _ value: K.Value) -> Self {
//        var newValues = self.view.environmentValues
//        newValues[ObjectIdentifier(keyPath)] = value
//        self.view.environmentValues = newValues
//        return self
//    }
}
