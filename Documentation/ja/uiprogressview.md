# UIProgressView

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます。

```swift
func progressViewStyle(_ progressViewStyle: UIProgressView.Style) -> Self

func progress(_ progress: Float, animated: Bool = false) -> Self

func progressTintColor(_ progressTintColor: UIColor?) -> Self

func trackTintColor(_ trackTintColor: UIColor?) -> Self

func progressImage(_ progressImage: UIImage?) -> Self

func trackImage(_ trackImage: UIImage?) -> Self

func observedProgress(_ observedProgress: Progress?) -> Self
```

#### sample

```swift
self.declarative {
    UIProgressView()
        .progressViewStyle(.default)
        .progressTintColor(.systemBlue)
        .trackTintColor(.systemGray5)
        .progress(0.5, animated: true)
}
```
