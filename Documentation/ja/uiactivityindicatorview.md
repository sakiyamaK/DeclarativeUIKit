# UIActivityIndicatorView

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます。

```swift
func style(_ style: UIActivityIndicatorView.Style) -> Self

func hidesWhenStopped(_ hidesWhenStopped: Bool) -> Self

func color(_ color: UIColor?) -> Self
```

### animating

アクティビティインジケータのアニメーションを制御するメソッドです。

```swift
func animating(_ isAnimating: Bool) -> Self
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| isAnimating | Bool | `true`の場合、アクティビティインジケータのアニメーションを開始します。`false`の場合、アニメーションを停止します。 |


#### sample

```swift
self.declarative {
    UIActivityIndicatorView()
        .style(.large)
        .color(.systemBlue)
        .animating(true)
}
```
