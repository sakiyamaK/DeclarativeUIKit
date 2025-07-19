# UIContentUnavailableView

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます。

```swift
@available(iOS 17.0, *)
func configuration(_ configuration: UIContentUnavailableConfiguration) -> Self
```

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
        .center()
    }
}
```
