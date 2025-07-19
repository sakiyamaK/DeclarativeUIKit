# UIColorWell

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます。

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
