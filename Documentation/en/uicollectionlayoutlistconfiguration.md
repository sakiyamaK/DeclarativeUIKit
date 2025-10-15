# UICollectionLayoutListConfiguration

## function

### some default parameters

```swift
    func showsSeparators(_ showsSeparators: Bool) -> Self
    
    func separatorConfiguration(_ separatorConfiguration: UIListSeparatorConfiguration) -> Self

    func itemSeparatorHandler(_ itemSeparatorHandler: UICollectionLayoutListConfiguration.ItemSeparatorHandler?) -> Self

    func backgroundColor(_ backgroundColor: UIColor?) -> Self

    func headerMode(_ footerMode: UICollectionLayoutListConfiguration.HeaderMode) -> Self

    func footerMode(_ footerMode: UICollectionLayoutListConfiguration.FooterMode) -> Self
    
    func leadingSwipeActionsConfigurationProvider(
        _ leadingSwipeActionsConfigurationProvider: UICollectionLayoutListConfiguration.SwipeActionsConfigurationProvider?
    ) -> Self

    func trailingSwipeActionsConfigurationProvider(
        _ trailingSwipeActionsConfigurationProvider: UICollectionLayoutListConfiguration.SwipeActionsConfigurationProvider?
    ) -> Self
    
    func headerTopPadding(_ headerTopPadding: CGFloat?) -> Self
```
