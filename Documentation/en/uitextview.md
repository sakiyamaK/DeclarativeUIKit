# UITextView

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
| text | String / NSAttributedString | Parameter to set `text` or `attributedText` values of `UITextView` |
| imperative | (Self) -> Void) | Parameters to set imperatively |

#### sample

```swift
self.declarative {
    UIStackView {
        UITextView("normal string")
            .font(UIFont.systemFont(ofSize: 12))
            .textAlignment(.center)

        UITextView("normal string") {
            // set parameters imperative
            $0.font(UIFont.systemFont(ofSize: 12))
            $0.textAlignment = .center
        }

        UITextView("parameters to assign to an instance")
            .assign(to: &textField)

        UITextView(NSAttributedString(string: "attributed string", attributes: [
            .foregroundColor: UIColor.blue,
            .font: UIFont.systemFont(ofSize: 24.0)
        ]))
        .textAlignment(.left)
    }.distribution(.fillEqually)
}
```

## function

### some default parameters

You can write default parameters declarative as below.

```swift
    func delegate(_ delegate: UITextViewDelegate?) -> Self

    func text(_ text: String?) -> Self

    func text(_ attrText: NSAttributedString?) -> Self

    func font(_ font: UIFont) -> Self

    func textColor(_ textColor: UIColor) -> Self

    func textAlignment(_ textAlignment: NSTextAlignment) -> Self

    func isEditable(_ isEditable: Bool) -> Self

    func isSelectable(_ isSelectable: Bool) -> Self

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
    
    func passwordRules(_ passwordRules: UITextInputPasswordRules?) -> Self
```

#### sample

```swift
self.declarative {
  UITextView()
      .text("普通の文字列")
      .font(UIFont.systemFont(ofSize: 12))
      .textColor(.black)
      .textAlignment(.center)
      .keyboardType(.alphabet)
      .delegate(self)
}
```
