# UIVisualEffectView

## function

### some default parameters

The following standard parameters can be written declaratively.

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
