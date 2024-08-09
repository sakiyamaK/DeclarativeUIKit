# UIStackView

## initializer

### init with layout parameters

Declarative layouts can be built in `UIStackView  
Multiple views can be placed in a `builder`.  
supports arrays and `if`.

```swift
init(axis: NSLayoutConstraint.Axis, alignment: Alignment, distribution: Distribution, spacing: CGFloat, _ builder: () -> [UIView?])

init(axis: NSLayoutConstraint.Axis, alignment: Alignment, distribution: Distribution, spacing: CGFloat, _ builder: (UIView) -> [UIView?])
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| axis | NSLayoutConstraint.Axis | Set the standard parameter axis, defaults to `vertical`. |
| alignment | Alignment | Set alignment for standard parameters, defaults to `fill` |
| distribution | Distribution | Set standard parameter distribution, default is `fill`. |
| spacing | CGFloat | Set standard parameter spacing, default `0`. |
| builder | () -> [UIView?] | Generate View to be placed |
|  parameter | 型 | description |
| ---- | ---- | ---- |
| builder | (UIView) -> [UIView?] | Generate a View to be placed by passing UIStackView itself as a parameter. |

#### sample

```swift
self.declarative {
    UIStackView {
        UIView.spacer()
            .backgroundColor(.red)
        UIView.spacer()
            .backgroundColor(.green)
        UIView.spacer()
            .backgroundColor(.blue)
    }.distribution(.fillEqually)
}
```

Example of determining the size of the View to be placed based on the size of the `UIStackView`.

```swift
self.declarative {
    UIStackView { superview in
        UIView.spacer()
            .backgroundColor(.blue)
            .heightEqual(to: superview, constraint: superview.heightAnchor * 0.8)
        UIView.spacer()
    }
}
```

Generate View from Array

```swift
self.declarative {
    UIStackView {
        [Int](1...5).compactMap({ _ in
            UIView.spacer().backgroundColor(.red)
        })
    }
    .distribution(.fillEqually)
    .spacing(10)
}
```

Control by `if

```swift
let isArray = false

self.declarative {
    UIStackView {
        if isArray {
            [Int](1...5).compactMap({ _ in
                UIView.spacer().backgroundColor(.red)
            })
        } else {
            UIView.spacer().backgroundColor(.blue)
        }
    }
    .distribution(.fillEqually)
    .spacing(10)
}
```

### init with vertical parameters

generate a `UIStackView` that arranges views vertically  
Multiple views can be placed in a `builder`.  
supports arrays and `if`.

```swift
vertical(alignment: Alignment, distribution: Distribution, spacing: CGFloat, isTouchTransparency: Bool, _ builder: () -> [UIView?])

vStack(alignment: Alignment, distribution: Distribution, spacing: CGFloat, isTouchTransparency: Bool, _ builder: () -> [UIView?])

vertical(alignment: Alignment, distribution: Distribution, spacing: CGFloat, isTouchTransparency: Bool, _ builder: (UIView) -> [UIView?])

vStack(alignment: Alignment, distribution: Distribution, spacing: CGFloat, isTouchTransparency: Bool, _ builder: (UIView) -> [UIView?])
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| alignment | Alignment | Set alignment for standard parameters, defaults to `fill` |
| distribution | Distribution | Set standard parameter distribution, default is `fill`. |
| spacing | CGFloat | Set standard parameter spacing, default `0`. |
| isTouchTransparency | Bool | Set whether or not only your own touch is made transparent. default is `false` |
| builder | () -> [UIView?] | Generate View to be placed |
|  parameter | 型 | description |
| ---- | ---- | ---- |
| builder | (UIView) -> [UIView?] | Generate a View to be placed by passing UIStackView itself as a parameter |

#### sample

```swift
self.declarative {
    UIStackView.vertical {
        UIView.spacer()
            .backgroundColor(.red)
        UIView.spacer()
            .backgroundColor(.green)
        UIView.spacer()
            .backgroundColor(.blue)
    }.distribution(.fillEqually)
}
```

See [here](#sample) for a sample using arrays and `if`.

### init with horizontal parameters

Generate a `UIStackView` that arranges views horizontally  
Multiple views can be placed in a `builder`.  
supports arrays and `if`.

```swift
horizontal(alignment: Alignment, distribution: Distribution, spacing: CGFloat, isTouchTransparency: Bool, _ builder: () -> [UIView?])

hStack(alignment: Alignment, distribution: Distribution, spacing: CGFloat, isTouchTransparency: Bool, _ builder: () -> [UIView?])

horizontal(alignment: Alignment, distribution: Distribution, spacing: CGFloat, isTouchTransparency: Bool, _ builder: (UIView) -> [UIView?])

hStack(alignment: Alignment, distribution: Distribution, spacing: CGFloat, isTouchTransparency: Bool, _ builder: (UIView) -> [UIView?])
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| alignment | Alignment | Set alignment for standard parameters, defaults to `fill` |
| distribution | Distribution | Set standard parameter distribution, default is `fill` |
| spacing | CGFloat | Set standard parameter spacing, default `0`. |
| isTouchTransparency | Bool | Set whether or not only your own touch is made transparent. default is `false` |
| builder | () -> [UIView?] | Generate View to be placed |

|  parameter | 型 | description |
| ---- | ---- | ---- |
| builder | (UIView) -> [UIView?] | Generate a View to be placed by passing UIStackView itself as a parameter |

#### sample

```swift
self.declarative {
    UIStackView.horizontal {
        UIView.spacer()
            .backgroundColor(.red)
        UIView.spacer()
            .backgroundColor(.green)
        UIView.spacer()
            .backgroundColor(.blue)
    }.distribution(.fillEqually)
}
```

For a sample using arrays and `if`, please refer to (here)[####sample

## function

### some default parameters

The following standard parameters can be written declaratively

```swift
func alignment(_ alignment: Alignment) -> Self

func distribution(_ distribution: Distribution) -> Self

func spacing(_ spacing: CGFloat) -> Self

func isBaselineRelativeArrangement(_ isBaselineRelativeArrangement: Bool) -> Self

func isLayoutMarginsRelativeArrangement(_ isLayoutMarginsRelativeArrangement: Bool) -> Self
```

#### sample

```swift
self.declarative {
    UIStackView {
        UIView.spacer().backgroundColor(.blue)
    }
    .alignment(.fill)
    .distribution(.fillEqually)
    .spacing(10)
}
```

### custom spacing

By setting customSpacing on the UIView, you can set a margin under each View

#### sample

```swift
self.declarative {
    UIStackView {
        UIView.spacer().backgroundColor(.blue)
          .customSpacing(20)
        UIView.spacer().backgroundColor(.blue)
          .customSpacing(30)
        UIView.spacer().backgroundColor(.blue)
        UIView.spacer().backgroundColor(.blue)
        UIView.spacer().backgroundColor(.blue)
    }
    .alignment(.fill)
    .distribution(.fillEqually)
    .spacing(10)
}
```

### margins

Margins can be set on the UIStackView

```swift
func margins(_ margins: NSDirectionalEdgeInsets) -> Self
```

#### sample

```swift
self.declarative {
    UIStackView {
        UIView.spacer().backgroundColor(.blue)
        UIView.spacer().backgroundColor(.green)
        UIView.spacer().backgroundColor(.red)
    }
    .alignment(.fill)
    .distribution(.fillEqually)
    .spacing(10)
    .margins(.init(horizontal: 30))
}
```