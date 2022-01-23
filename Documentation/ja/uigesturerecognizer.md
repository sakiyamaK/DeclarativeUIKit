# UIGestureRecognizer

## initilizer

### init with target action

```swift
    init(target: Any?, _ actionBuilder: () -> Selector?)
```

#### sample

```swift
self.declarative {
  UIView()
      .backgroundColor(.red)
      .isUserInteractionEnabled(true)
      .addGestureRecognizer {
          UIGestureRecognizer(target: self) {
              #selector(tapAction)
          }
      }
}
```

