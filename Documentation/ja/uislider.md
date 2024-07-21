# UISlider

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます

```swift
    func value(_ value: Float) -> Self

    func minimumValue(_ minimumValue: Float) -> Self

    func maximumValue(_ maximumValue: Float) -> Self

    func minimumValueImage(_ minimumValueImage: UIImage?) -> Self

    func maximumValueImage(_ maximumValueImage: UIImage?) -> Self

    func isContinuous(_ isContinuous: Bool) -> Self

    func minimumTrackTintColor(_ minimumTrackTintColor: UIColor?) -> Self

    func maximumTrackTintColor(_ maximumTrackTintColor: UIColor?) -> Self

    func thumbTintColor(_ thumbTintColor: UIColor?) -> Self

    func value(_ value: Float, animated: Bool) -> Self

    func thumbImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self

    func minimumTrackImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self

    func maximumTrackImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self
```

#### sample

```swift
self.declarative {
  UISlider()
      .minimumValue(0)
      .maximumValue(10)
      .value(5)
      .tintColor(.systemRed)
      .center()
}
```