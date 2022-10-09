# UIMenu

## initializer

### init with parameters

```swift
    init(title: String? = nil, image: UIImage? = nil, identifier: Identifier? = nil, options: Options = .displayInline, _ childrenBuilder: () -> [UIMenuElement?])
```

#### sample

```swift
self.declarative {
  UIButton("Menu Button")
      .menu(UIMenu(title: "Super Menu") {
          UIAction(title: "Select 1", state: .on) { _ in }
          UIAction(title: "Select 2") { _ in }
          
          UIMenu(title: "Sub Menu") {
              UIAction(title: "Destructive", image: UIImage(systemName: "pencil.circle"), attributes: .destructive) { _ in }
          }
      })
      .center()
}
```