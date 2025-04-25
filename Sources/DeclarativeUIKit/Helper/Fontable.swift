//
//  Fontable.swift
//  DeclarativeUIKit
//
//  Created by sakiyamaK on 2025/04/26.
//

import UIKit

// MARK: - Fontable

protocol Fontable where Self: UIView {
    @discardableResult
    func set(font: UIFont) -> Self
}

extension UILabel: Fontable {
    @discardableResult
    func set(font: UIFont) -> Self {
        if self.font == UILabel().font {
            self.font = font
        }
        return self
    }
}

extension UITextView: Fontable {
    @discardableResult
    func set(font: UIFont) -> Self {
        if self.font == UITextView().font {
            self.font = font
        }
        return self
    }
}

extension UISearchTextField: Fontable {
    @discardableResult
    func set(font: UIFont) -> Self {
        if self.font  == UISearchTextField().font {
            self.font = font
        }
        return self
    }
}

extension UISearchBar: Fontable {
    @discardableResult
    func set(font: UIFont) -> Self {
        self.searchTextField.set(font: font)
        return self
    }
}
