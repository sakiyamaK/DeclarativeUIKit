# UIVisualEffectView

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます。

```swift
func effect(_ effect: UIVisualEffect?) -> Self
```

#### sample

```swift
self.declarative {
    UIVisualEffectView(effect: UIBlurEffect(style: .light))
        .frame(width: 200, height: 200)
        .center()
}
```
