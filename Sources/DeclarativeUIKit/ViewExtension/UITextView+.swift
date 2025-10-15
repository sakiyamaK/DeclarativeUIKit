//
//  UITextView+.swift
//  
//
//  Created by Hajime Taniguchi on 9/3/22.
//

import UIKit.UITextView

private extension UITextView {
    @discardableResult
    func setup(text: String?) -> Self {
        guard let text else {
            self.text = nil
            self.attributedText = nil
            return self
        }
        self.text = text
        return self
    }

    @discardableResult
    func setup(attributedText: NSAttributedString?) -> Self {
        guard let attributedText else {
            self.text = nil
            self.attributedText = nil
            return self
        }
        self.attributedText = attributedText
        return self
    }
}

//MARK: -
public extension UITextView {
    convenience init(_ text: String?) {
        self.init(frame: .zero)
        self.setup(text: text)
    }
        
    convenience init(_ text: String?, _ apply: (Self) -> Void) {
        self.init(frame: .zero)
        self.setup(text: text)
        apply(self)
    }

    convenience init(_ text: NSAttributedString?) {
        self.init(frame: .zero)
        self.setup(attributedText: text)
    }
    
    convenience init(_ text: NSAttributedString?, _ apply: (Self) -> Void) {
        self.init(frame: .zero)
        self.setup(attributedText: text)
        apply(self)
    }
}

//MARK: - Declarative method
public extension UITextView {

    @discardableResult
    func delegate(_ delegate: UITextViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    
    @discardableResult
    func text(_ text: String?) -> Self {
        self.setup(text: text)
    }
    
    @discardableResult
    func text(_ attributedText: NSAttributedString?) -> Self {
        self.setup(attributedText: attributedText)
    }
    
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.font = font
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
    func isEditable(_ isEditable: Bool) -> Self {
        self.isEditable = isEditable
        return self
    }

    @discardableResult
    func isSelectable(_ isSelectable: Bool) -> Self {
        self.isSelectable = isSelectable
        return self
    }
}

// MARK: - UITextInputTraits
public extension UITextView {
    
    @discardableResult
    func autocapitalizationType( _ autocapitalizationType: UITextAutocapitalizationType) -> Self {
        self.autocapitalizationType = autocapitalizationType
        return self
    }

    @discardableResult
    func autocorrectionType(_ autocorrectionType: UITextAutocorrectionType) -> Self {
        self.autocapitalizationType = autocapitalizationType
        return self
    }

    @discardableResult
    func spellCheckingType(_ spellCheckingType: UITextSpellCheckingType) -> Self {
        self.spellCheckingType = spellCheckingType
        return self
    }

    @discardableResult
    func smartQuotesType(_ smartQuotesType: UITextSmartQuotesType) -> Self {
        self.smartQuotesType = smartQuotesType
        return self
    }

    @discardableResult
    func smartDashesType(_ smartDashesType: UITextSmartDashesType) -> Self {
        self.smartDashesType = smartDashesType
        return self
    }

    @discardableResult
    func smartInsertDeleteType(_ smartInsertDeleteType: UITextSmartInsertDeleteType) -> Self {
        self.smartInsertDeleteType = smartInsertDeleteType
        return self
    }

    @discardableResult
    func keyboardType(_ keyboardType: UIKeyboardType) -> Self {
        self.keyboardType = keyboardType
        return self
    }

    @discardableResult
    func keyboardAppearance(_ keyboardAppearance: UIKeyboardAppearance) -> Self {
        self.keyboardAppearance = keyboardAppearance
        return self
    }

    @discardableResult
    func returnKeyType(_ returnKeyType: UIReturnKeyType) -> Self {
        self.returnKeyType = returnKeyType
        return self
    }
    
    @discardableResult
    func enablesReturnKeyAutomatically(_ enablesReturnKeyAutomatically: Bool) -> Self {
        self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        return self
    }

    @discardableResult
    func isSecureTextEntry(_ isSecureTextEntry: Bool) -> Self {
        self.isSecureTextEntry = isSecureTextEntry
        return self
    }
    
    @discardableResult
    func textContentType(_ textContentType: UITextContentType) -> Self {
        self.textContentType = textContentType
        return self
    }
    
    @discardableResult
    func passwordRules(_ passwordRules: UITextInputPasswordRules?) -> Self {
        self.passwordRules = passwordRules
        return self
    }
}
