//
//  File.swift
//  
//
//  Created by Hajime Taniguchi on 9/3/22.
//

import UIKit.UITextView
import UIKit

private extension UITextView {
    @discardableResult
    func setup(attrText: NSAttributedString?) -> Self {
        guard let attrText = attrText else {
            self.text = nil
            self.attributedText = nil
            return self
        }
        self.attributedText = attrText
        return self
    }
}

//MARK: -
public extension UITextView {
    convenience init(_ text: String?) {
        self.init(frame: .zero)
        self.text(text)
    }
        
    convenience init(_ text: String?, _ imperative: (Self) -> Void) {
        self.init(frame: .zero)
        self.text(text)
        imperative(self)
    }

    convenience init(_ text: NSAttributedString?) {
        self.init(frame: .zero)
        self.text(text)
    }
    
    convenience init(_ text: NSAttributedString?, _ imperative: (Self) -> Void) {
        self.init(frame: .zero)
        self.text(text)
        imperative(self)
    }
}

//MARK: - Declarative method
public extension UITextView {

    @discardableResult
    func text(_ text: String?) -> Self {
        guard let text = text else {
            return self.setup(attrText: nil)
        }
        return self.setup(attrText: NSAttributedString(string: text))
    }
    
    @discardableResult
    func text(_ attrText: NSAttributedString?) -> Self {
        return self.setup(attrText: attrText)
    }
    
    @discardableResult
    func textColor(_ textColor: UIColor) -> Self {
        self.textColor = textColor
        return self
    }

    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    func keyboardType(_ keyboardType: UIKeyboardType) -> Self {
        self.keyboardType = keyboardType
        return self
    }
    
    @discardableResult
    func delegate(_ delegate: UITextViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    
    @discardableResult
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }

    @discardableResult
    func isEditable(_ isEditable: Bool) -> Self {
        self.isEditable = isEditable
        return self
    }

    @discardableResult
    func isScrollEnabled(_ isScrollEnabled: Bool) -> Self {
        self.isScrollEnabled = isScrollEnabled
        return self
    }
}
