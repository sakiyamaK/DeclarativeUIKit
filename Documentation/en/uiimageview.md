# UIImageView

## initializer

### init with image

#### 
```swift
    init(_ image: UIImage?)
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| image | UIImage | Value of `image` parameter of `UIImageView |


#### sample

```swift
self.declarative {
    UIScrollView {
        UIStackView.vertical {
            UIImageView(UIImage(systemName: "square.and.arrow.up"))
                .contentMode(.scaleAspectFit)
                .width(200)
                .height(200)
        }.alignment(.center)
  }
}
```

## function

### some default parameters

The following standard parameters can be written declaratively.

```swift
    func image(_ image: UIImage?) -> Self
```

#### sample

```swift
self.declarative {
    UIImageView()
        .image(UIImage(systemName: "square.and.arrow.up"))
}
```