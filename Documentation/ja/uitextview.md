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
| text | String / NSAttributedString | `UITextView`の`text`パラメータ、もしくは`attributedText`の値 |
| imperative | (Self) -> Void) | 手続的に設定するためのパラメータ |

#### sample

```swift
self.declarative {
    UIStackView {
        UITextView("普通の文字列")
            .font(UIFont.systemFont(ofSize: 12))
            .textAlignment(.center)

        UITextView("普通の文字列") {
            // 手続的にパラメータを設定
            $0.font(UIFont.systemFont(ofSize: 12))
            $0.textAlignment = .center
        }

        UITextView("インスタンスのパラメータに代入")
            .assign(to: &textField)

        UITextView(NSAttributedString(string: "装飾文字", attributes: [
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
    func delegate(_ delegate: UITextViewDelegate?) -> Self

    func text(_ text: String?) -> Self

    func text(_ attrText: NSAttributedString?) -> Self

    func font(_ font: UIFont) -> Self

    func textColor(_ textColor: UIColor) -> Self

    func textAlignment(_ textAlignment: NSTextAlignment) -> Self

    func keyboardType(_ keyboardType: UIKeyboardType) -> Self

    func isEditable(_ isEditable: Bool) -> Self

    func isScrollEnabled(_ isScrollEnabled: Bool) -> Self

    func isSelectable(_ isSelectable: Bool) -> Self

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