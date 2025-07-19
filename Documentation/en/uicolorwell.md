# UIColorWell

## function

### some default parameters

The following standard parameters can be written declaratively.

```swift
func selectedColor(_ color: UIColor?) -> Self

func supportsAlpha(_ supportsAlpha: Bool) -> Self

func title(_ title: String?) -> Self
```

#### sample

```swift
self.declarative {
    UIColorWell()
        .selectedColor(.red)
        .supportsAlpha(true)
        .title("Select Color")
}
```
