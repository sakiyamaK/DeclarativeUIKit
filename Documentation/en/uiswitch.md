# UISwitch

## initializer

```swift
init(_ frame: CGRect = .zero, _ imperative: (Self) -> Void)
```

## function

### some default parameters

The following standard parameters can be written declaratively

```swift
func isOn(_ isOn: Bool) -> Self

func onTintColor(_ onTintColor: UIColor?) -> Self

func thumbTintColor(_ thumbTintColor: UIColor?) -> Self

func onImage(_ onImage: UIImage?) -> Self

func offImage(_ offImage: UIImage?) -> Self

@available(iOS 14.0, *)
func preferredStyle(_ preferredStyle: UISwitch.Style) -> Self

@available(iOS 14.0, *)
func title(_ title: String?) -> Self
```

#### sample

```swift
self.declarative {
  UISwitch()
      .isOn(true)
      .onTintColor(.red)
      .add(target: self, action: #selector(self.uiSwitchValueChanged(sender:)), for: .valueChanged)
}
```