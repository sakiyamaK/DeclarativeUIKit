# UIContentUnavailableConfiguration

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます。

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

これらの関数は、`UIAction`を明示的に作成することなく、クロージャを使用してボタンアクションを設定する便利な方法を提供します。

```swift
@available(iOS 17.0, *)
func button(_ buttonConfiguration: UIButton.Configuration, primaryActionHandler: @escaping UIActionHandler) -> Self

@available(iOS 17.0, *)
func secondaryButton(_ secondaryButtonConfiguration: UIButton.Configuration, primaryActionHandler: @escaping UIActionHandler) -> Self
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| buttonConfiguration | UIButton.Configuration | ボタンの設定。 |
| primaryActionHandler | UIActionHandler | ボタンがタップされたときに実行されるクロージャ。 |

#### sample

```swift
self.declarative {
    if #available(iOS 17.0, *) {
        UIContentUnavailableView(
            configuration: UIContentUnavailableConfiguration.empty()
                .text("コンテンツがありません")
                .secondaryText("現在表示するコンテンツがありません。後でもう一度お試しください。")
                .image(UIImage(systemName: "exclamationmark.triangle.fill"))
                .button(UIButton.Configuration.filled().title("再読み込み")) { _ in
                    print("再読み込みボタンがタップされました！")
                }
                .secondaryButton(UIButton.Configuration.bordered().title("キャンセル")) { _ in
                    print("キャンセルボタンがタップされました！")
                }
                .imageToTextPadding(20)
                .textToSecondaryTextPadding(10)
                .textToButtonPadding(30)
                .buttonToSecondaryButtonPadding(10)
        )
    }
}
```
