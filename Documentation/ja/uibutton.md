# UIButton

## initilizer

### init with title

#### 
```swift
    init(_ image: UIImage?, for: UIControl.State)
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| title | String | `UIButton`の`title`パラメータ`の値 |
| for | UIControl.State | `UIButton`の`State`パラメータの値、デフォルトは`normal` |

### init with image

#### 
```swift
    init(_ image: UIImage?, for: UIControl.State)
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| image | UIImage | `UIButton`の`image`パラメータ`の値 |
| for | UIControl.State | `UIButton`の`State`パラメータの値、デフォルトは`normal` |

#### sample

```swift
self.declarative {
    UIScrollView {
      UIStackView.vertical {
          UIButton("aiueo", for: .normal)
              .titleColor(.black)
   
          UIButton(UIImage(systemName: "square.and.arrow.up"), for: .normal)
      }
  }
}
```

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます
`for`パラメータは全てデフォルトで`normal`です

```swift
    func title(_ title: String?, for: UIControl.State) -> Self

    func titleColor(_ color: UIColor?, for: UIControl.State)
    
    func font(_ font: UIFont?) -> Self
    
    func image(_ image: UIImage?, for: UIControl.State) -> Self
```

#### sample

```swift
self.declarative {
  UIButton()
      .title("test")
      .titleColor(.black)
      .font(UIFont.systemFont(ofSize: 20))
      .image(UIImage(systemName: "square.and.arrow.up"))
}
```