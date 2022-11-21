# UISearchBar

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます

```swift
  func barStyle(_ barStyle: UIBarStyle) -> Self

  func delegate(_ delegate: UISearchBarDelegate?) -> Self

  func text(_ text: String?) -> Self

  func prompt(_ prompt: String?) -> Self

  func placeholder(_ placeholder: String?) -> Self

  func showsBookmarkButton(_ showsBookmarkButton: Bool) -> Self

  func showsCancelButton(_ showsCancelButton: Bool) -> Self

  func showsSearchResultsButton(_ showsSearchResultsButton: Bool) -> Self

  func isSearchResultsButtonSelected(_ isSearchResultsButtonSelected: Bool) -> Self

  func showsCancelButton(_ showsCancelButton: Bool, animated: Bool) -> Self

  func tintColor(_ tintColor: UIColor) -> Self

  func barTintColor(_ barTintColor: UIColor?) -> Self

  func searchBarStyle(_ searchBarStyle: UISearchBar.Style) -> Self

  func isTranslucent(_ isTranslucent: Bool) -> Self

  func scopeButtonTitles(_ scopeButtonTitles: [String]?) -> Self

  func selectedScopeButtonIndex(_ selectedScopeButtonIndex: Int) -> Self

  func showsScopeBar(_ showsScopeBar: Bool) -> Self

  func showsScope(_ show: Bool, animated animate: Bool) -> Self

  func inputAccessoryView(_ inputAccessoryView: UIView?) -> Self

  func backgroundImage(_ backgroundImage: UIImage?) -> Self

  func scopeBarBackgroundImage(_ scopeBarBackgroundImage: UIImage?) -> Self

  func backgroundImage(_ backgroundImage: UIImage?, for barPosition: UIBarPosition, barMetrics: UIBarMetrics) -> Self

  func searchFieldBackgroundImage(_ backgroundImage: UIImage?, for state: UIControl.State) -> Self

  func image(_ iconImage: UIImage?, for icon: UISearchBar.Icon, state: UIControl.State) -> Self

  func scopeBarButtonBackgroundImage(_ backgroundImage: UIImage?, for state: UIControl.State) -> Self

  func scopeBarButtonDividerImage(_ dividerImage: UIImage?, forLeftSegmentState leftState: UIControl.State, rightSegmentState rightState: UIControl.State) -> Self

  func scopeBarButtonTitleTextAttributes(_ attributes: [NSAttributedString.Key : Any]?, for state: UIControl.State) -> Self

  func searchFieldBackgroundPositionAdjustment(_ searchFieldBackgroundPositionAdjustment: UIOffset) -> Self

  func searchTextPositionAdjustment(_ searchTextPositionAdjustment: UIOffset) -> Self

  func positionAdjustment(_ adjustment: UIOffset, for icon: UISearchBar.Icon) -> Self

```

#### sample

```swift
self.declarative {
    UISearchBar()
        .delegate(self)
        .barStyle(.default)
        .text("テキストだよ")
        .prompt("promptだよ")
        .placeholder("プレースホルダーだよ")
        .showsBookmarkButton(true)
        .showsCancelButton(true)
        .showsSearchResultsButton(true)
        .isSearchResultsButtonSelected(true)
        .searchBarStyle(.prominent)
        .isTranslucent(false)
        .inputAccessoryView(
            UIImageView(UIImage(named: "person_01"))
                .contentMode(.scaleAspectFit)
                .backgroundColor(.gray)
                .frame(CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        )
        .backgroundImage(UIImage(named: "person_01"))
        .image(UIImage(named: "person_01"), for: .bookmark, state: .focused)
        .searchTextPositionAdjustment(.init(horizontal: 30, vertical: 0))
        .searchFieldBackgroundPositionAdjustment(.init(horizontal: 0, vertical: 0))
        .top()
}
```