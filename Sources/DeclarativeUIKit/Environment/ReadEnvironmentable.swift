//
//  ReadEnvironmentable.swift
//  DeclarativeUIKit
//
//  Created by sakiyamaK on 2025/08/06.
//

import UIKit
import SwiftUICore

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
