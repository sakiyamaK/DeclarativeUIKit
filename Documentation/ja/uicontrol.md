# UIControl

## function

### add target action

```swift
    func add(target: Any?, action: Selector, for controlEvents: UIControl.Event) -> Self

    func add(target: Any?, for controlEvents: UIControl.Event, _ actionBuilder: () -> Selector) -> Self
```

#### sample

```swift
self.declarative {
    UIStackView.vertical {
        UIButton("tap")
            .add(target: self, for: .touchUpInside) {
                #selector(tapAction)
            }
        
        UIButton("tap")
            .add(target: self, action: #selector(tapAction), for: .touchUpInside)

    }.alignment(.center)
}
```