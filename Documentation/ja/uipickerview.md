# UIPickerView

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます

```swift
    func dataSource(_ dataSource: NSObject & UIPickerViewDataSource) -> Self

    func delegate(_ delegate: NSObject & UIPickerViewDelegate) -> Self
```

#### sample

```swift
self.declarative {
    UIPickerView()
    .dataSource(self)
    .delegate(self)
}
```