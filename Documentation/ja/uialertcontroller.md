# UIAlertController

## initializer

### init with preferredStyle

#### 
```swift
    init(title: String?, message: String?, preferredStyle: Style, _ builder: (() -> [UIAlertAction?])
```


## function
### some default parameters

以下の標準パラメータは宣言的に記述できます

```swift
    func title(_ title: String?, for: UIControl.State) -> Self

    func titleColor(_ color: UIColor?, for: UIControl.State)
    
    func font(_ font: UIFont?) -> Self
    
    func image(_ image: UIImage?, for: UIControl.State) -> Self
```

### sample

```swift
self.present(
  UIAlertController(preferredStyle: .alert)
      .title("sample title")
      .message("sample message")
      .addAction {
          UIAlertAction(title: "Action", style: .default) { _ in
              print("action")
          }
      }
      .addPreferredAction {
          UIAlertAction(title: "PreferredAction", style: .default) { _ in
              print("action")
          }
      }
      .addActions {
          UIAlertAction(title: "Action", style: .default) { _ in
          }

          UIAlertAction(title: "Cancel", style: .cancel) { _ in
          }
      }
      .addTextField(withHandler: { textField in
        textField.textAlignment(.center)
      })

, animated: true)
```
