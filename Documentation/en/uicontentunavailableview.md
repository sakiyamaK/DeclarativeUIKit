# UIContentUnavailableView

## function

### some default parameters

The following standard parameters can be written declaratively.

```swift
@available(iOS 17.0, *)
func configuration(_ configuration: UIContentUnavailableConfiguration) -> Self
```

#### sample

```swift
self.declarative {
    if #available(iOS 17.0, *) {
        UIContentUnavailableView(
            configuration: UIContentUnavailableConfiguration.empty()
                .text("No Content Available")
                .secondaryText("There is no content to display at this time.")
                .image(UIImage(systemName: "exclamationmark.triangle.fill"))
                .button(UIButton.Configuration.filled().title("Reload")) { _ in
                    print("Reload button tapped!")
                }
                .secondaryButton(UIButton.Configuration.bordered().title("Cancel")) { _ in
                    print("Cancel button tapped!")
                }
                .imageToTextPadding(20)
                .textToSecondaryTextPadding(10)
                .textToButtonPadding(30)
                .buttonToSecondaryButtonPadding(10)
        )
    }
}
```
