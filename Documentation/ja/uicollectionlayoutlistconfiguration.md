# UICollectionLayoutListConfiguration

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます

```swift
    func showsSeparators(_ showsSeparators: Bool) -> Self
    
    @available(iOS 14.5, *)
    func separatorConfiguration(_ separatorConfiguration: UIListSeparatorConfiguration) -> Self

    @available(iOS 14.5, *)
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
    
    @available(iOS 15.0, *)
    func headerTopPadding(_ headerTopPadding: CGFloat?) -> Self
```