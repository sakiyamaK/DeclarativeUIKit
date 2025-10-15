# UIButton

## initilizer

### init with title

#### 
```swift
init(_ image: UIImage?, for: UIControl.State)
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| title | String or NSAttributedString | Value of `title` parameter of `UIButton`. |
| for | UIControl.State | Value of `State` parameter of `UIButton`, default `normal`. |

### init with image

#### 
```swift
init(_ image: UIImage?, for: UIControl.State)
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| image | UIImage | Value of `image` parameter of `UIButton |
| for | UIControl.State | Value of `State` parameter of `UIButton`, default `normal`. |

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

### init with configurationBuilder

```swift
init(configurationBuilder: (() -> UIButton.Configuration), primaryAction: UIAction?)
```

## function

### some default parameters

The following standard parameters can be written declaratively.
All `for` parameters are `normal` by default.

```swift
func title(_ title: String?, for: UIControl.State) -> Self

func title(_ title: NSAttributedString?, for: UIControl.State) -> Self

func titleColor(_ color: UIColor?, for: UIControl.State) -> Self

func titleShadowColor(_ color: UIColor?, for state: UIControl.State) -> Self

func backgroundImage(_ image: UIImage?, for state: UIControl.State) -> Self

func image(_ image: UIImage?, for: UIControl.State) -> Self

func preferredSymbolConfiguration(_ configuration: UIImage.SymbolConfiguration?, forImageIn state: UIControl.State) -> Self

func font(_ font: UIFont?) -> Self

func contentEdgeInset(_ contentEdgeInsets: UIEdgeInsets) -> Self

func titleEdgeInsets(_ titleEdgeInsets: UIEdgeInsets) -> Self

func imageEdgeInsets(_ imageEdgeInsets: UIEdgeInsets) -> Self

func menu(_ menu: UIMenu) -> Self

func showsMenuAsPrimaryAction(_ showsMenuAsPrimaryAction: Bool) -> Self

func configuration(_ configuration: UIButton.Configuration) -> Self

func configuration(_ configurationBuilder: (() -> UIButton.Configuration)) -> Self
```

#### sample

```swift
self.declarative {
  UIButton()
      .title("test")
      .titleColor(.black)
      .font(UIFont.systemFont(ofSize: 20))
      .image(UIImage(systemName: "square.and.arrow.up"))
      .contentEdgeInset(.init(all: 10))
}
```
