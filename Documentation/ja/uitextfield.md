# UITextField

## initilizer

### init with parameters

```swift
    init(_ text: String?)
        
    init(_ text: String?, _ imperative: (Self) -> Void)

    init(_ text: NSAttributedString?)
    
    init(_ text: NSAttributedString?, _ imperative: (Self) -> Void)
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| text | String / NSAttributedString | `UITextField`の`text`パラメータ、もしくは`attributedText`の値 |
| imperative | (Self) -> Void) | 手続的に設定するためのパラメータ |

#### sample

```swift
self.declarative {
    UIStackView {
        UITextField("普通の文字列")
            .font(UIFont.systemFont(ofSize: 12))
            .textAlignment(.center)

        UITextField("普通の文字列") {
            // 手続的にパラメータを設定
            $0.font(UIFont.systemFont(ofSize: 12))
            $0.textAlignment = .center
        }

        UITextField("インスタンスのパラメータに代入")
            .assign(to: &textField)

        UITextField(NSAttributedString(string: "装飾文字", attributes: [
            .foregroundColor: UIColor.blue,
            .font: UIFont.systemFont(ofSize: 24.0)
        ]))
        .textAlignment(.left)
    }.distribution(.fillEqually)
}
```

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます

```swift
    func delegate(_ delegate: UITextFieldDelegate?) -> Self

    func text(_ text: String?) -> Self

    func text(_ attrText: NSAttributedString?) -> Self

    func font(_ font: UIFont) -> Self

    func textColor(_ textColor: UIColor) -> Self

    func textAlignment(_ textAlignment: NSTextAlignment) -> Self

    func keyboardType(_ keyboardType: UIKeyboardType) -> Self

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
```

#### sample

```swift
self.declarative {
  UITextField()
      .text("普通の文字列")
      .font(UIFont.systemFont(ofSize: 12))
      .textColor(.black)
      .textAlignment(.center)
      .borderStyle(.line)
      .keyboardType(.alphabet)
      .delegate(self)
}
```