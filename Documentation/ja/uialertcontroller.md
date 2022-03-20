# UIAlertController

## function
TODO

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
