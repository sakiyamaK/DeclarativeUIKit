# UIActivityIndicatorView

## function

### some default parameters

The following standard parameters can be written declaratively.

```swift
func style(_ style: UIActivityIndicatorView.Style) -> Self

func hidesWhenStopped(_ hidesWhenStopped: Bool) -> Self

func color(_ color: UIColor?) -> Self
```

### animating

Methods to control the animation of the activity indicator.

```swift
func animating(_ isAnimating: Bool) -> Self
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| isAnimating | Bool | If `true`, the activity indicator starts animating. If `false`, it stops animating. |


#### sample

```swift
self.declarative {
    UIActivityIndicatorView()
        .style(.large)
        .color(.systemBlue)
        .animating(true)
}
```
