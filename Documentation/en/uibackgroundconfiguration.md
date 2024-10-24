# UIBackgroundConfiguration

@available(iOS 15.0, *)

## function

### some default parameters

The following standard parameters can be written declaratively.

```swift
@discardableResult
    func customView(_ value: UIView?) -> Self
    
    @discardableResult
    func cornerRadius(_ cornerRadius: CGFloat) -> Self
    
    @discardableResult
    func backgroundInsets(_ value: NSDirectionalEdgeInsets) -> Self

    @discardableResult
    func edgesAddingLayoutMarginsToBackgroundInsets(_ value: NSDirectionalRectEdge) -> Self

    @discardableResult
    func backgroundColor(_ value: UIColor?) -> Self
    
    @discardableResult
    func backgroundColorTransformer(_ value: UIConfigurationColorTransformer?) -> Self

    @discardableResult
    func visualEffect(_ value: UIVisualEffect?) -> Self

    @available(iOS 15.0, *)
    @discardableResult
    func image(_ value: UIImage?) -> Self

    @available(iOS 15.0, *)
    @discardableResult
    func imageContentMode(_ value: UIView.ContentMode) -> Self

    @discardableResult
    func strokeColor(_ value: UIColor?) -> Self

    @discardableResult
    func strokeColorTransformer(_ value: UIConfigurationColorTransformer?) -> Self

    @discardableResult
    func strokeWidth(_ value: CGFloat) -> Self

    @discardableResult
    func strokeOutset(_ value: CGFloat) -> Self
```

### sample

```swift
```

