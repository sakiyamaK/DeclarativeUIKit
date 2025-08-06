//
//  HelperReadEnvironmentView.swift
//  DeclarativeUIKit
//
//  Created by sakiyamaK on 2025/08/06.
//

import UIKit
import SwiftUICore

public extension UIView {
    private struct AssociatedKeys {
        static var environmentValues: UInt8 = 0
    }

    var environmentValues: [ObjectIdentifier: Any] {
        get {
            objc_getAssociatedObject(self, &AssociatedKeys.environmentValues) as? [ObjectIdentifier: Any] ?? [:]
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.environmentValues, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

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
