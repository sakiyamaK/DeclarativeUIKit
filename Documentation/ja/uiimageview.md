# UIImageView

## initializer

### init with image

#### 
```swift
    init(_ image: UIImage?)
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| image | UIImage | `UIImageView`の`image`パラメータ`の値 |


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

以下の標準パラメータは宣言的に記述できます

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