# UIStepper

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます。

```swift
func value(_ value: Double) -> Self

func minimumValue(_ minimumValue: Double) -> Self

func maximumValue(_ maximumValue: Double) -> Self

func stepValue(_ stepValue: Double) -> Self

func isContinuous(_ isContinuous: Bool) -> Self

func wraps(_ wraps: Bool) -> Self

func backgroundImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self

func dividerImage(_ image: UIImage?, forLeftSegmentState leftState: UIControl.State = .normal, rightSegmentState rightState: UIControl.State = .normal) -> Self

func incrementImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self

func decrementImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self
```

#### sample

```swift
self.declarative {
    UIStepper()
        .value(5.0)
        .minimumValue(0.0)
        .maximumValue(10.0)
        .stepValue(0.5)
        .isContinuous(true)
        .wraps(false)
        .backgroundImage(UIImage(systemName: "rectangle.fill"), for: .normal)
        .incrementImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        .decrementImage(UIImage(systemName: "minus.circle.fill"), for: .normal)
        .dividerImage(UIImage(systemName: "line.horizontal.3"), forLeftSegmentState: .normal, rightSegmentState: .normal)
}
```
