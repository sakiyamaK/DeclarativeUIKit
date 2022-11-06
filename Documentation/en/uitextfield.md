# UITextField

## initializer

### init with parameters

```swift
init(_ text: String?)
    
init(_ text: String?, _ imperative: (Self) -> Void)

init(_ text: NSAttributedString?)

init(_ text: NSAttributedString?, _ imperative: (Self) -> Void)
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| text | String / NSAttributedString | The value of `text` parameter of `UITextField` or `attributedText`. |
| imperative | (Self) -> Void) | Parameters for imperative setting |

#### sample

```swift
self.declarative {
    UIStackView {
        UITextField("normal string")
            .font(UIFont.systemFont(ofSize: 12))
            .textAlignment(.center)

        UITextField("normal string") {
            $0.font(UIFont.systemFont(ofSize: 12))
            $0.textAlignment = .center
        }

        UITextField("Assign to instance parameters")
            .assign(to: &textField)

        UITextField(NSAttributedString(string: "attributed string", attributes: [
            .foregroundColor: UIColor.blue,
            .font: UIFont.systemFont(ofSize: 24.0)
        ]))
        .textAlignment(.left)
    }.distribution(.fillEqually)
}
```

## function

### some default parameters

The following standard parameters can be written declaratively

```swift
    func delegate(_ delegate: UITextFieldDelegate?) -> Self

    func text(_ text: String?) -> Self

    func text(_ attrText: NSAttributedString?) -> Self

    func font(_ font: UIFont) -> Self

    func textColor(_ textColor: UIColor) -> Self

    func textAlignment(_ textAlignment: NSTextAlignment) -> Self

    func borderStyle(_ borderStyle: UITextField.BorderStyle) -> Self

    func placeholder(_ placeholder: String?) -> Self

    func placeholder(_ placeholder: NSAttributedString?) -> Self

    func background(_ image: UIImage?) -> Self

    func disabledBackground(_ image: UIImage?) -> Self

    func clearButtonMode(_ clearButtonMode: UITextField.ViewMode) -> Self

    func leftView(_ leftView: UIView?) -> Self

    func leftViewMode(_ leftViewMode: UITextField.ViewMode) -> Self

    func rightView(_ rightView: UIView?) -> Self

    func rightViewMode(_ rightViewMode: UITextField.ViewMode) -> Self

    func inputView(_ inputView: UIView?) -> Self

    func inputAccessoryView(_ inputAccessoryView: UIView?) -> Self

    func clearsOnInsertion(_ clearsOnInsertion: Bool) -> Self

    func autocapitalizationType( _ autocapitalizationType: UITextAutocapitalizationType) -> Self 

    func autocorrectionType(_ autocorrectionType: UITextAutocorrectionType) -> Self

    func spellCheckingType(_ spellCheckingType: UITextSpellCheckingType) -> Self

    func smartQuotesType(_ smartQuotesType: UITextSmartQuotesType) -> Self

    func smartDashesType(_ smartDashesType: UITextSmartDashesType) -> Self

    func smartInsertDeleteType(_ smartInsertDeleteType: UITextSmartInsertDeleteType) -> Self

    func keyboardType(_ keyboardType: UIKeyboardType) -> Self

    func keyboardAppearance(_ keyboardAppearance: UIKeyboardAppearance) -> Self

    func returnKeyType(_ returnKeyType: UIReturnKeyType) -> Self
    
    func enablesReturnKeyAutomatically(_ enablesReturnKeyAutomatically: Bool) -> Self

    func isSecureTextEntry(_ isSecureTextEntry: Bool) -> Self
    
    func textContentType(_ textContentType: UITextContentType) -> Self
    
    @available(iOS 12.0, *)    
    func passwordRules(_ passwordRules: UITextInputPasswordRules?) -> Self
```

#### sample

```swift
self.declarative {
  UITextField()
      .text("normal string")
      .font(UIFont.systemFont(ofSize: 12))
      .textColor(.black)
      .textAlignment(.center)
      .borderStyle(.line)
      .keyboardType(.alphabet)
      .delegate(self)
}
```