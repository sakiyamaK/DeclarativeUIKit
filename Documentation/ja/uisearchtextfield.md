# UISearchTextField

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます

```swift
    func tokes(_ tokens: [UISearchToken]) -> Self

    func insert(token: UISearchToken, at tokenIndex: Int) -> Self

    func removeToken(index: Int) -> Self

    func replaceTextualPortion(textRange: UITextRange, with token: UISearchToken, at tokenIndex: Int) -> Self

    func tokenBackgroundColor(_ tokenBackgroundColor: UIColor) -> Self

    func allowsDeletingTokens(_ allowsDeletingTokens: Bool) -> Self

    func allowsCopyingTokens(_ allowsCopyingTokens: Bool) -> Self

    @available(iOS 16.0, *)
    func searchSuggestions(_ searchSuggestions: [any UISearchSuggestion]?) -> Self
```

#### sample

```swift
self.declarative {
  UISearchTextField()
      .tokes(
          [.init(
              icon: nil,
                text: "aaa"
            ),
            .init(
                icon: nil,
                text: "bbbb"
            ),
          ]
      )
      .center()
}
```