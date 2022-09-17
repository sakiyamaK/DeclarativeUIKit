# UIPickerView

## function

### some default parameters

You can set default parameters declaratively as below.

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