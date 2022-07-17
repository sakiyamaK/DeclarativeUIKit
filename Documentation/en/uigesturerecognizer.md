# UIGestureRecognizer

## initilizer

### init with target action

```swift
    init(target: Any?, _ actionBuilder: () -> Selector?)

    init(target: Any, _ action: @escaping ((Any) -> Void))
```

#### sample

```swift
self.declarative {
  UIStackView.vertical {
    UIView()
        .backgroundColor(.red)
        .isUserInteractionEnabled(true)
        .addGestureRecognizer {
            UIGestureRecognizer(target: self) {
                #selector(tapAction)
            }
        }

      UIView()
        .backgroundColor(.red)
        .isUserInteractionEnabled(true)
        .addGestureRecognizer {
            UIGestureRecognizer(target: self) { sender in
              print(sender)
            }
        }
  }
}
```

