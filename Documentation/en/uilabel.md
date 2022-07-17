# UILabel

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
| text | String / NSAttributedString | The value of `text` parameter of `UILabel` or `attributedText`. |
| imperative | (Self) -> Void) | Parameters for imperative setting |

#### sample

```swift
self.declarative {
    UIStackView {
        UILabel("normal string")
            .font(UIFont.systemFont(ofSize: 12))
            .textAlignment(.center)

        UILabel("normal string") {
            $0.font(UIFont.systemFont(ofSize: 12))
            $0.textAlignment = .center
        }

        UILabel("Assign to instance parameters")
            .assign(to: &label)

        UILabel(NSAttributedString(string: "attributed string", attributes: [
            .foregroundColor: UIColor.blue,
            .font: UIFont.systemFont(ofSize: 24.0)
        ]))
        .textAlignment(.left)
    }.distribution(.fillEqually)
}
```

## function

### some default parameters

The following standard parameters can be written declaratively.

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
        .text("normal string")
        .font(UIFont.systemFont(ofSize: 12))
        .numberOfLines(1)
        .textColor(.black)
        .textAlignment(.center)
}
```