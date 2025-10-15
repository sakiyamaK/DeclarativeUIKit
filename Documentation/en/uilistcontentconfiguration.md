# UIListContentConfiguration

## function

### some default parameters

The following standard parameters can be written declaratively.

```swift
    func image(_ image: UIImage?) -> Self
    func imageProperties(_ imageProperties: UIListContentConfiguration.ImageProperties) -> Self
    func text(_ text: String) -> Self
    func text(_ attributedText: NSAttributedString) -> Self
    func attributedText(_ attributedText: NSAttributedString) -> Self
    func textProperties(_ textProperties: UIListContentConfiguration.TextProperties) -> Self
    func secondaryText(_ secondaryText: String) -> Self
    func secondaryText(_ secondaryText: NSAttributedString) -> Self
    func secondaryAttributedText(_ secondaryAttributedText: NSAttributedString) -> Self
    func secondaryTextProperties(_ secondaryTextProperties: UIListContentConfiguration.TextProperties) -> Self
    func axesPreservingSuperviewLayoutMargins(_ axesPreservingSuperviewLayoutMargins: UIAxis) -> Self
    func directionalLayoutMargins(_ directionalLayoutMargins: NSDirectionalEdgeInsets) -> Self
    func prefersSideBySideTextAndSecondaryText(_ prefersSideBySideTextAndSecondaryText: Bool) -> Self
    func imageToTextPadding(_ imageToTextPadding: CGFloat) -> Self
    func textToSecondaryTextHorizontalPadding(_ textToSecondaryTextHorizontalPadding: CGFloat) -> Self
    func textToSecondaryTextVerticalPadding(_ textToSecondaryTextVerticalPadding: CGFloat) -> Self
```
