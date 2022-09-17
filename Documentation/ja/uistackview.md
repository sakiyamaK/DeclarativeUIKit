# UIStackView

## initializer

### init with layout parameters

`UIStackView`に宣言的にレイアウトを構築することができます  
`builder`内は複数のview配置することができます  
配列や`if`にも対応しています

```swift
init(axis: NSLayoutConstraint.Axis, alignment: Alignment, distribution: Distribution, spacing: CGFloat, _ builder: () -> [UIView?])

init(axis: NSLayoutConstraint.Axis, alignment: Alignment, distribution: Distribution, spacing: CGFloat, _ builder: (UIView) -> [UIView?])
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| axis | NSLayoutConstraint.Axis | 標準パラメータのaxisを設定する、デフォルトは`vertical` |
| alignment | Alignment | 標準パラメータのalignmentを設定する、デフォルトは`fill` |
| distribution | Distribution | 標準パラメータのdistributionを設定する、デフォルトは`fill` |
| spacing | CGFloat | 標準パラメータのspacingを設定する、デフォルトは`0` |
| builder | () -> [UIView?] | 配置するViewを生成する |

|  parameter | 型 | description |
| ---- | ---- | ---- |
| builder | (UIView) -> [UIView?] | UIStackView自身をパラメータとし渡して配置するViewを生成する |

#### sample

```swift
self.declarative {
    UIStackView {
        UIView.spacer()
            .backgroundColor(.red)
        UIView.spacer()
            .backgroundColor(.green)
        UIView.spacer()
            .backgroundColor(.blue)
    }.distribution(.fillEqually)
}
```

`UIStackView`の大きさから配置するViewのサイズを決める例

```swift
self.declarative {
    UIStackView { superview in
        UIView.spacer()
            .backgroundColor(.blue)
            .heightEqual(to: superview, constraint: superview.heightAnchor * 0.8)
        UIView.spacer()
    }
}
```

配列からViewを生成

```swift
self.declarative {
    UIStackView {
        [Int](1...5).compactMap({ _ in
            UIView.spacer().backgroundColor(.red)
        })
    }
    .distribution(.fillEqually)
    .spacing(10)
}
```

`if`による制御

```swift
let isArray = false

self.declarative {
    UIStackView {
        if isArray {
            [Int](1...5).compactMap({ _ in
                UIView.spacer().backgroundColor(.red)
            })
        } else {
            UIView.spacer().backgroundColor(.blue)
        }
    }
    .distribution(.fillEqually)
    .spacing(10)
}
```

### init with vertical parameters

縦方向にビューを並べていく`UIStackView`を生成します  
`builder`内は複数のview配置することができます  
配列や`if`にも対応しています

```swift
vertical(alignment: Alignment, distribution: Distribution, spacing: CGFloat, isTouchTransparency: Bool, _ builder: () -> [UIView?])

vStack(alignment: Alignment, distribution: Distribution, spacing: CGFloat, isTouchTransparency: Bool, _ builder: () -> [UIView?])

vertical(alignment: Alignment, distribution: Distribution, spacing: CGFloat, isTouchTransparency: Bool, _ builder: (UIView) -> [UIView?])

vStack(alignment: Alignment, distribution: Distribution, spacing: CGFloat, isTouchTransparency: Bool, _ builder: (UIView) -> [UIView?])
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| alignment | Alignment | 標準パラメータのalignmentを設定する、デフォルトは`fill` |
| distribution | Distribution | 標準パラメータのdistributionを設定する、デフォルトは`fill` |
| spacing | CGFloat | 標準パラメータのspacingを設定する、デフォルトは`0` |
| isTouchTransparency | Bool | 自身のタッチのみ透過させるか設定する、デフォルトは`false` |
| builder | () -> [UIView?] | 配置するViewを生成する |

|  parameter | 型 | description |
| ---- | ---- | ---- |
| builder | (UIView) -> [UIView?] | UIStackView自身をパラメータとし渡して配置するViewを生成する |

#### sample

```swift
self.declarative {
    UIStackView.vertical {
        UIView.spacer()
            .backgroundColor(.red)
        UIView.spacer()
            .backgroundColor(.green)
        UIView.spacer()
            .backgroundColor(.blue)
    }.distribution(.fillEqually)
}
```

配列や`if`を使ったサンプルは[こちら](#sample)を参考にしてください

### init with horizontal parameters

横方向にビューを並べていく`UIStackView`を生成します  
`builder`内は複数のview配置することができます  
配列や`if`にも対応しています

```swift
horizontal(alignment: Alignment, distribution: Distribution, spacing: CGFloat, isTouchTransparency: Bool, _ builder: () -> [UIView?])

hStack(alignment: Alignment, distribution: Distribution, spacing: CGFloat, isTouchTransparency: Bool, _ builder: () -> [UIView?])

horizontal(alignment: Alignment, distribution: Distribution, spacing: CGFloat, isTouchTransparency: Bool, _ builder: (UIView) -> [UIView?])

hStack(alignment: Alignment, distribution: Distribution, spacing: CGFloat, isTouchTransparency: Bool, _ builder: (UIView) -> [UIView?])
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| alignment | Alignment | 標準パラメータのalignmentを設定する、デフォルトは`fill` |
| distribution | Distribution | 標準パラメータのdistributionを設定する、デフォルトは`fill` |
| spacing | CGFloat | 標準パラメータのspacingを設定する、デフォルトは`0` |
| isTouchTransparency | Bool | 自身のタッチのみ透過させるか設定する、デフォルトは`false` |
| builder | () -> [UIView?] | 配置するViewを生成する |

|  parameter | 型 | description |
| ---- | ---- | ---- |
| builder | (UIView) -> [UIView?] | UIStackView自身をパラメータとし渡して配置するViewを生成する |

#### sample

```swift
self.declarative {
    UIStackView.horizontal {
        UIView.spacer()
            .backgroundColor(.red)
        UIView.spacer()
            .backgroundColor(.green)
        UIView.spacer()
            .backgroundColor(.blue)
    }.distribution(.fillEqually)
}
```

配列や`if`を使ったサンプルは(こちら)[####sample]を参考にしてください

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます

```swift
func alignment(_ alignment: Alignment) -> Self

func distribution(_ distribution: Distribution) -> Self

func spacing(_ spacing: CGFloat) -> Self
```

#### sample

```swift
self.declarative {
    UIStackView {
        UIView.spacer().backgroundColor(.blue)
    }
    .alignment(.fill)
    .distribution(.fillEqually)
    .spacing(10)
}
```

### custom spacing

UIViewにcustomSpacingを設定することでそれぞれのViewの下に余白を設定することができます

#### sample

```swift
self.declarative {
    UIStackView {
        //このviewの下は20の余白
        UIView.spacer().backgroundColor(.blue)
          .customSpacing(20)
        //このviewの下は30の余白
        UIView.spacer().backgroundColor(.blue)
          .customSpacing(30)
        //customSpacingが設定されていないviewは通常通りUIStackViewのspacing(10)が効く
        UIView.spacer().backgroundColor(.blue)
        UIView.spacer().backgroundColor(.blue)
        UIView.spacer().backgroundColor(.blue)
    }
    .alignment(.fill)
    .distribution(.fillEqually)
    .spacing(10)
}
```
