# UIButtonConfiguration

@available(iOS 15.0, *)

## function

### some default parameters

The following standard parameters can be written declaratively.

```swift
func background(_ background: UIBackgroundConfiguration) -> Self 
func cornerStyle(_ cornerStyle: UIButton.Configuration.CornerStyle) -> Self
func buttonSize(_ buttonSize: UIButton.Configuration.Size) -> Self
func macIdiomStyle(_ macIdiomStyle: UIButton.Configuration.MacIdiomStyle) -> Self
func baseForegroundColor(_ baseForegroundColor: UIColor?) -> Self
func baseBackgroundColor(_ baseBackgroundColor: UIColor?) -> Self
func image(_ image: UIImage?) -> Self
func imageColorTransformer(_ imageColorTransformer: UIConfigurationColorTransformer?) -> Self
func preferredSymbolConfigurationForImage(_ preferredSymbolConfigurationForImage: UIImage.SymbolConfiguration?) -> Self
func showsActivityIndicator(_ showsActivityIndicator: Bool) -> Self
func activityIndicatorColorTransformer(_ activityIndicatorColorTransformer: UIConfigurationColorTransformer?) -> Self
func title(_ title: String?) -> Self
func attributedTitle(_ attributedTitle: AttributedString?) -> Self
func titleTextAttributesTransformer(_ titleTextAttributesTransformer: UIConfigurationTextAttributesTransformer?) -> Self
func subtitle(_ subtitle: String?) -> Self
func attributedSubtitle(_ attributedSubtitle: AttributedString?) -> Self
func subtitleTextAttributesTransformer(_ subtitleTextAttributesTransformer: UIConfigurationTextAttributesTransformer?) -> Self
@available(iOS 16.0, *)
func indicator(_ indicator: UIButton.Configuration.Indicator) -> Self
@available(iOS 16.0, *)
func indicatorColorTransformer(_ indicatorColorTransformer: UIConfigurationColorTransformer?) -> Self
func contentInsets(_ contentInsets: NSDirectionalEdgeInsets) -> Self
func imagePlacement(_ imagePlacement: NSDirectionalRectEdge) -> Self
func imagePadding(_ imagePadding: CGFloat) -> Self
func titlePadding(_ titlePadding: CGFloat) -> Self
func titleAlignment(_ titleAlignment: UIButton.Configuration.TitleAlignment) -> Self
```