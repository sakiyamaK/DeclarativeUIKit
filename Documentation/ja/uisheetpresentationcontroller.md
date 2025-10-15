# UISheetPresentationController

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます

```swift
func delegate(_ delegate: UISheetPresentationControllerDelegate?) -> Self

func sourceView(_ sourceView: UIView?) -> Self

func prefersEdgeAttachedInCompactHeight(_ prefersEdgeAttachedInCompactHeight: Bool) -> Self

func widthFollowsPreferredContentSizeWhenEdgeAttached(_ widthFollowsPreferredContentSizeWhenEdgeAttached: Bool) -> Self

func prefersGrabberVisible(_ prefersGrabberVisible: Bool) -> Self

func detents(_ detents: [UISheetPresentationController.Detent]) -> Self

func selectedDetentIdentifier(_ selectedDetentIdentifier: UISheetPresentationController.Detent.Identifier?) -> Self

func largestUndimmedDetentIdentifier(_ largestUndimmedDetentIdentifier: UISheetPresentationController.Detent.Identifier?) -> Self

func prefersScrollingExpandsWhenScrolledToEdge(_ prefersScrollingExpandsWhenScrolledToEdge: Bool) -> Self

func preferredCornerRadius(_ preferredCornerRadius: CGFloat?) -> Self
```
