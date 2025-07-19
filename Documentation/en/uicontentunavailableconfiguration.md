# UIContentUnavailableConfiguration

## function

### some default parameters

The following standard parameters can be written declaratively.

```swift
@available(iOS 17.0, *)
func text(_ text: String?) -> Self

@available(iOS 17.0, *)
func text(_ attributedText: NSAttributedString?) -> Self

@available(iOS 17.0, *)
func attributedText(_ attributedText: NSAttributedString?) -> Self

@available(iOS 17.0, *)
func textProperties(_ textProperties: UIContentUnavailableConfiguration.TextProperties) -> Self

@available(iOS 17.0, *)
func secondaryText(_ secondaryText: String?) -> Self

@available(iOS 17.0, *)
func secondaryText(_ secondaryAttributedText: NSAttributedString?) -> Self

@available(iOS 17.0, *)
func secondaryAttributedText(_ secondaryAttributedText: NSAttributedString?) -> Self

@available(iOS 17.0, *)
func secondaryTextProperties(_ secondaryTextProperties: UIContentUnavailableConfiguration.TextProperties) -> Self

@available(iOS 17.0, *)
func image(_ image: UIImage?) -> Self

@available(iOS 17.0, *)
func imageProperties(_ imageProperties: UIContentUnavailableConfiguration.ImageProperties) -> Self

@available(iOS 17.0, *)
func button(_ buttonConfiguration: UIButton.Configuration, primaryAction: UIAction? = nil) -> Self

@available(iOS 17.0, *)
func buttonProperties(_ buttonProperties: UIContentUnavailableConfiguration.ButtonProperties) -> Self

@available(iOS 17.0, *)
func secondaryButton(_ secondaryButtonConfiguration: UIButton.Configuration, primaryAction: UIAction? = nil) -> Self

@available(iOS 17.0, *)
func secondaryButtonProperties(_ secondaryButtonProperties: UIContentUnavailableConfiguration.ButtonProperties) -> Self

@available(iOS 17.0, *)
func background(_ background: UIBackgroundConfiguration) -> Self

@available(iOS 17.0, *)
func alignment(_ alignment: UIContentUnavailableConfiguration.Alignment) -> Self

@available(iOS 17.0, *)
func axesPreservingSuperviewLayoutMargins(_ axes: UIAxis) -> Self

@available(iOS 17.0, *)
func directionalLayoutMargins(_ directionalLayoutMargins: NSDirectionalEdgeInsets) -> Self

@available(iOS 17.0, *)
func imageToTextPadding(_ padding: CGFloat) -> Self

@available(iOS 17.0, *)
func textToSecondaryTextPadding(_ padding: CGFloat) -> Self

@available(iOS 17.0, *)
func textToButtonPadding(_ padding: CGFloat) -> Self

@available(iOS 17.0, *)
func buttonToSecondaryButtonPadding(_ padding: CGFloat) -> Self
```

### custom functions

These functions provide a convenient way to set button actions using a closure, without explicitly creating a `UIAction`.

```swift
@available(iOS 17.0, *)
func button(_ buttonConfiguration: UIButton.Configuration, primaryActionHandler: @escaping UIActionHandler) -> Self

@available(iOS 17.0, *)
func secondaryButton(_ secondaryButtonConfiguration: UIButton.Configuration, primaryActionHandler: @escaping UIActionHandler) -> Self
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| buttonConfiguration | UIButton.Configuration | The configuration for the button. |
| primaryActionHandler | UIActionHandler | A closure to be executed when the button is tapped. |

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
