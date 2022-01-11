# UIView

## initilizer

### init(tag: Int)

```swift
init(tag: Int)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| tag | Int | Viewのタグ |

## function

### declarative

declarativeのbuilderパラメータ内でUIViewを宣言的に記述します

```swift
func declarative(priorities: UIEdgePriorities, _ builder: () -> UIView)
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| priorities | [UIEdgePriorities](parameter.md#uIEdgePriorities) | builderパラメータで生成されたViewの上下左右の制約の優先度、デフォルトは全て`required` |
| builder | () -> UIView | UIViewのレイアウトを宣言的に記述する |

#### sample

`UILabel`や`UIImageView`を並べるサンプルです

```swift
import UIKit
import DeclarativeUIKit

final class SampleView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
          //宣言的にレイアウトを記述していく
          self.declarative {
            UIStackView {
                UILabel("aa").font(UIFont.systemFont(ofSize: 30))

                UIStackView.horizontal {
                    UIView.spacer()
                    UIImageView(UIImage(systemName: "pencil"))
                        .size(width: 100, height: 100)
                    UIView.spacer()
                }

                UIView.spacer()
            }
        }
    }
}

```

## imperative

`UIView`のパラメータを標準の通り手続的に実装するメソッドです

```swift
func imperative(_ imperative: ((Self) -> Void)) -> Self

static func imperative(_ imperative: ((Self) -> Void)) -> Self
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| imperative | ((Self) -> Void) | 自身を引数として渡すことで内部で手続き的にパラメータを記述する |

#### sample

`UILabel`のパラメータを手続き的に設定するサンプルです

```swift
self.declarative {
    UIStackView {
        //staticメソッドとして呼び出せる
        UILabel.imperative {
            //内部で手続き的に設定できる
            let label = $0 as! UILabel
            label.text = "sample1"
            label.font = UIFont.systemFont(ofSize: 20)
            label.textColor = .red
        }
        //インスタンス生成後にも呼び出せる
        UILabel("sample2").imperative {
            let label = $0 as! UILabel
            label.font = UIFont.systemFont(ofSize: 20)
            label.textColor = .blue
        }
        UIView.spacer()
    }
}
```

### some default parameters

以下の標準パラメータは宣言的に記述できます

```swift
func tag(_ tag: Int) -> Self

func backgroundColor(_ backgroundColor: UIColor) -> Self

func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self

func clipsToBounds(_ clipsToBounds: Bool) -> Self

func contentMode(_ contentMode: ContentMode) -> Self

func alpha(_ alpha: CGFloat) -> Self

func isHidden(_ isHidden: Bool) -> Self

func isShow(_ isShow: Bool) -> Self //isHiddenの逆

func transform(_ transform: CGAffineTransform) -> Self

func contentHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self

func contentCompressionResistancePriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self

```

#### sample

```swift
self.declarative {
    UIView()
        .tag(1)
        .backgroundColor(.red)
        .isUserInteractionEnabled(false)
        .clipsToBounds(true)
        .contentMode(.scaleToFill)
        .alpha(0.5)
        .isHidden(false)
        .transform(.init(rotationAngle: 45.0/(2*Double.pi)))
        .contentHuggingPriority(.defaultHigh, for: .vertical)
        .contentCompressionResistancePriority(.defaultHigh, for: .vertical)
}
```

## cornerRadius

角丸にするメソッドです

```swift
func cornerRadius(_ radius: CGFloat, maskedCorners: CACornerMask) -> Self
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| radius | CGFloat | どれだけ丸くするか決めるパラメータ |
| maskedCorners | CACornerMask | 四隅のどこを丸くするか決めるパラメータ,デフォルトは`[.layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner]` |

#### sample

```swift
//優先度を下げて中のViewが伸びないようにする
self.declarative(priorities: .init(top: .required, leading: .required, bottom: .defaultLow, trailing: .defaultLow)) {
    //赤丸を表示する
    UIView()
        .size(width: 100, height: 100)
        .cornerRadius(50, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        .backgroundColor(.red)
}
```

## border

枠線を付けるメソッドです

```swift
func border(color: UIColor, width: CGFloat) -> Self
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| color | UIColor | 線の色 |
| width | CGFloat | 線の太さ |

### sample
```swift
//優先度を下げて中のViewが伸びないようにする
self.declarative(priorities: .init(top: .required, leading: .required, bottom: .defaultLow, trailing: .defaultLow)) {
    //赤い枠線を付ける
    UIView()
        .size(width: 100, height: 100)
        .border(color: .red, width: 10)
}
```

## shadow

影を付けるメソッド

```swift
func shadow(color: UIColor, radius: CGFloat, x: CGFloat, y: CGFloat) -> Self
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| color | UIColor | 影の色、デフォルトは`black` |
| radius | CGFloat | 影の強さ、デフォルトは`0` |
| x | CGFloat | 影のオフセット、デフォルトは`0` |
| y | CGFloat | 影のオフセット、デフォルトは`0` |

### sample
```swift
//優先度を下げて中のViewが伸びないようにする
self.declarative(priorities: .init(top: .required, leading: .required, bottom: .defaultLow, trailing: .defaultLow)) {
    //黒い影を付ける
    UIView()
        .size(width: 100, height: 100)
        .backgroundColor(.white)
        .shadow(color: .black, radius: 10, x: 10, y: 10)
}
```

## add gesture

`UIView`にジェスチャーを付けるメソッドです

```swift
//定義済みのジェスチャーを設定する
func add(gestureRecognizer: UIGestureRecognizer) -> Self
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| gestureRecognizer | UIGestureRecognizer | ジェスチャー |

```swift
//宣言的にジェスチャーを設定する
func addGestureRecognizer(_ gestureBuilder: () -> UIGestureRecognizer) -> Self
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| gestureBuilder | () -> UIGestureRecognizer | 宣言的にジェスチャーを設定する |

### sample
```swift
//ジェスチャーを定義
let tap = UITapGestureRecognizer(target: self, action: #selector(tapView))

self.declarative {
    UIStackView {
        //事前に定義したジェスチャーを登録
        UIView()
            .add(gestureRecognizer: tap)

        //宣言的にジェスチャーを登録
        UIView()
            .addGestureRecognizer {
                UITapGestureRecognizer(target: self) {
                    #selector(tapView)
                }
            }
    }
}
```

## addSubView

Viewをz方向に重ねるメソッドです
builderで生成されたViewを自身と同じ大きさで貼り付けます

```swift
func addSubview(margin: UIEdgeInsets, priorities: UIEdgePriorities,
    @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> Self

func zStack(margin: UIEdgeInsets, priorities: UIEdgePriorities,
    @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> Self
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| margin | UIEdgeInsets | 四隅に付ける余白 |
| priorities | UIEdgePriorities | 四隅の制約の優先度 |
| builder | () -> [UIView?] | 宣言的にViewを設定します |