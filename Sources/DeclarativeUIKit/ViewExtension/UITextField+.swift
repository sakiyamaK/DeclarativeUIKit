//
//  File.swift
//  
//
//  Created by sakiyamaK on 2022/02/13.
//

import UIKit.UITextField
import UIKit

//MARK: -
private extension UITextField {
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
    
    @discardableResult
    func setupPlaceholder(attrText: NSAttributedString?) -> Self {
        guard let attrText = attrText else {
            self.placeholder = nil
            self.attributedPlaceholder = nil
            return self
        }
        self.attributedPlaceholder = attrText
        return self
    }
}

//MARK: -
public extension UITextField {
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
public extension UITextField {

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
    func textColor(_ textColor: UIColor) -> Self {
        self.textColor = textColor
        return self
    }

    @discardableResult
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }

    @discardableResult
    func borderStyle(_ borderStyle: UITextField.BorderStyle) -> Self {
        self.borderStyle = borderStyle
        return self
    }

    @discardableResult
    func placeholder(_ placeholder: String?) -> Self {
        guard let text = text else {
            return self.setupPlaceholder(attrText: nil)
        }
        return self.setupPlaceholder(attrText: NSAttributedString(string: text))
    }

    @discardableResult
    func placeholder(_ placeholder: NSAttributedString?) -> Self {
        return self.setupPlaceholder(attrText: placeholder)
    }

    @discardableResult
    func delegate(_ delegate: UITextFieldDelegate?) -> Self {
        self.delegate = delegate
        return self
    }

    @discardableResult
    func background(_ image: UIImage?) -> Self {
        self.background = image
        return self
    }

    @discardableResult
    func disabledBackground(_ image: UIImage?) -> Self {
        self.disabledBackground = image
        return self
    }

    @discardableResult
    func clearButtonMode(_ clearButtonMode: UITextField.ViewMode) -> Self {
        self.clearButtonMode = clearButtonMode
        return self
    }

    @discardableResult
    func leftView(_ leftView: UIView?) -> Self {
        self.leftView = leftView
        return self
    }

    @discardableResult
    func leftViewMode(_ leftViewMode: UITextField.ViewMode) -> Self {
        self.leftViewMode = leftViewMode
        return self
    }

    @discardableResult
    func rightView(_ rightView: UIView?) -> Self {
        self.rightView = rightView
        return self
    }

    @discardableResult
    func rightViewMode(_ rightViewMode: UITextField.ViewMode) -> Self {
        self.rightViewMode = rightViewMode
        return self
    }

    @discardableResult
    func inputView(_ inputView: UIView?) -> Self {
        self.inputView = inputView
        return self
    }

    @discardableResult
    func inputAccessoryView(_ inputAccessoryView: UIView?) -> Self {
        self.inputAccessoryView = inputAccessoryView
        return self
    }

    @discardableResult
    func clearsOnInsertion(_ clearsOnInsertion: Bool) -> Self {
        self.clearsOnInsertion = clearsOnInsertion
        return self
    }
}
