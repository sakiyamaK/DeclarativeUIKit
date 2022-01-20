# UILabel

## initilizer

### init with parameters

`UILabel`に宣言的にレイアウトを構築することができます  
`builder`内は複数のview配置することができます  
配列や`if`にも対応しています

```swift
    init(_ text: String?)
        
    init(_ text: String?, _ imperative: (Self) -> Void)

    init(_ text: NSAttributedString?)
    
    init(_ text: NSAttributedString?, _ imperative: (Self) -> Void)
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| text | String / NSAttributedString | `UILabel`の`text`パラメータ、もしくは`attributedText`の値 |
| imperative | (Self) -> Void) | 手続的に設定するためのパラメータ |

#### sample

```swift
self.declarative {
    UIStackView {
        UILabel("普通の文字列")
            .font(UIFont.systemFont(ofSize: 12))
            .textAlignment(.center)

        UILabel("普通の文字列") {
            // 手続的にパラメータを設定
            $0.font(UIFont.systemFont(ofSize: 12))
            $0.textAlignment = .center
        }

        UILabel("インスタンスのパラメータに代入")
            .assign(to: &label)

        UILabel(NSAttributedString(string: "装飾文字", attributes: [
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
    func text(_ text: String?) -> Self

    func text(_ attrText: NSAttributedString?) -> Self

    func font(_ font: UIFont) -> Self

    func numberOfLines(_ numberOfLines: Int) -> Self

    func textColor(_ textColor: UIColor) -> Self

    func textAlignment(_ textAlignment: NSTextAlignment) -> Self
```

#### sample

```swift
self.declarative {
    UILabel(assign: &label)
        .text("普通の文字列")
        .font(UIFont.systemFont(ofSize: 12))
        .numberOfLines(1)
        .textColor(.black)
        .textAlignment(.center)
}
```