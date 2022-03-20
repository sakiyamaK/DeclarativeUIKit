# UIAlertViewController

## function
TODO

### sample

```swift

self.present(
  UIAlertController(preferredStyle: .actionSheet)
      .title("sample title")
      .message("sample message")
      .addActions {
          
          UIAlertAction(title: "OK", style: .default) { _ in
              self.present(
                  UIAlertController(preferredStyle: .alert)
                      .title("select ok")
                      .addAction {
                          UIAlertAction(title: "close", style: .default) { _ in }
                      }
                  , animated: true)
          }
                              
          UIAlertAction(title: "NO", style: .default) { _ in
              self.present(
                  UIAlertController(preferredStyle: .alert)
                      .title("select no")
                      .addAction {
                          UIAlertAction(title: "close", style: .default) { _ in }
                      }
                  , animated: true)
          }
          
          UIAlertAction(title: "Cancel", style: .cancel) { _ in
          }
      }
, animated: true)
```
