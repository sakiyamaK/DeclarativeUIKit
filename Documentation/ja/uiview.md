# UIView

## initializer

### init with tag

```swift
init(tag: Int)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| tag | Int | Viewのタグ |

### init with assign

クラスのパラメータに代入するためのパラメータをもつイニシャライザです

```swift
init<T>(assign variable: inout T)
```

#### sample

```swift
import UIKit
import DeclarativeUIKit

final class MainViewController: UIViewController {
    
    private weak var mainLabel: UILabel!
    
    override func loadView() {
        super.loadView()
        
        self.declarative {
            //宣言的に定義したUILabelをmainLabelに代入する
            UILabel(assign: &mainLabel)
                .text("text")
                .font(.systemFont(ofSize: 20))
        }
    }
    
    func configure(text: String) {
        mainLabel.text = text
    }
}
```

### spacer

`isUserInteractionEnabled`が`false`に設定されたViewを生成します

```swift
static func spacer() -> UIView
```

### divider

`isUserInteractionEnabled`が`false`、`height`が`0.5`、`backgroundColor`が`lightGray`に設定されたViewを生成します

```swift
static func divider() -> UIView
```

## function

### declarative

declarativeのbuilderパラメータ内でUIViewを宣言的に記述します

```swift
func declarative(priorities: UIEdgePriorities, _ builder: () -> UIView)
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| priorities | [UIEdgePriorities](parameter.md#uiedgepriorities) | builderパラメータで生成されたViewの上下左右の制約の優先度、デフォルトは全て`required` |
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

### imperative

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

### assign

クラスのパラメータに代入します

```swift
func assign<T>(to variable: inout T) -> Self
```

#### sample

```swift
import UIKit
import DeclarativeUIKit

final class MainViewController: UIViewController {
    
    private weak var mainLabel: UILabel!
    
    override func loadView() {
        super.loadView()
        
        self.declarative {
            //宣言的に定義したUILabelをmainLabelに代入する
            UILabel("text")
                .font(.systemFont(ofSize: 20))
                .assign(to: &mainLabel)
        }
    }
    
    func configure(text: String) {
        mainLabel.text = text
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

## contentPriorities

`ContentHuggingPriority`と`ContentCompressionResistancePriority`を同時に設定するメソッドです

```swift
func contentPriorities(_ priorities: UIContentPriorities) -> Self
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| priorities | UIContentPriorities | contentHuggingPriorityとcontentCompressionResistancePriorityを決めるパラメータ、デフォルトは全て`nil`のためクラスの設定に準拠する |

#### sample

```swift
self.declarative {
    //contentHuggingPriorityのhorizontalとvertical,
    //contentCompressionResistancePriorityのhorizontalとvertical
    //全て.requiredにする
    UILabel("contents")
      .contentPriorities(.init(all: .required))
      .center()
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

影を付けるメソッドです

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

ジェスチャーを付けるメソッドです

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

## zStack

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
| builder | () -> [UIView?] | 宣言的にViewを設定する |

### sample

```swift
self.declarative {
    UIView.spacer()
        .backgroundColor(.red)
        //余白を10つけてbottomの制約をdefaultLowにして上に重ねる
        .zStack(
            margin: .init(top: 10, left: 10, bottom: 10, right: 10),
            priorities: .init(top: .required, leading: .required, bottom: .defaultLow, trailing: .required)
        ) {
            //高さ100の青いview
            UIView.spacer().height(100).backgroundColor(.blue)
        }
}
```

## padding

自身のViewの周りに余白を生成します  
  
これは自身のViewのz方向の後ろ側に別のViewを生成することで実現されます  
そのため、このメソッド以降に宣言したメソッドは後ろのViewに設定されます

```swift
func padding(value: CGFloat, touchTransparency: Bool, priorities: UIEdgePriorities) -> UIView

func padding(insets: UIEdgeInsets, touchTransparency: Bool, priorities: UIEdgePriorities) -> UIView
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| value | CGFloat | 四隅に付ける余白 |
| touchTransparency | Bool | 広げた余白のタッチを透過させるかどうか、デフォルトは`true` |
| priorities | UIEdgePriorities | 余白と自身の四隅の制約の優先度、デフォルトは全て`required` |

|  parameter | 型 | description |
| ---- | ---- | ---- |
| inserts | UIEdgeInsets | 四隅に付ける余白(個別に付ける) |

### sample

赤いViewの周りに20の余白で青いViewをつける例です

```swift
self.declarative {
    UIView()
        .backgroundColor(.red)
        //ここまでは元のViewに付けられる設定
        .padding(insets: .init(all: 20))
        //padding以降は余白側のViewに付けられる設定
        .backgroundColor(.blue)
}

```

## center

Viewを親ビューの中央に配置する  
  
これはViewをStackViewのhorizontalとverticalを重ねてalignmentをcenterに設定して実現されます  
そのため、このメソッド以降に宣言したメソッドは後ろのViewに設定されます
`centerX()`、`centerY()`はそれぞれX方向Y方向だけセンター揃えさせます

```swift
func center() -> UIView

func centerX() -> UIView

func centerY() -> UIView
```
### sample

赤いViewを画面の中央に配置します

```swift
self.declarative {
    UIView()
        .backgroundColor(.red)
        .size(width: 100, height: 100)
        .center()
}

```

## top,bottom,left,right

Viewを親ビューの上下左右に配置する 

これはViewをStackViewのhorizontalまたはverticalを利用して設定されます
そのため、このメソッド以降に宣言したメソッドは後ろのViewに設定されます

```swift
func top() -> UIView

func bottom() -> UIView

func left() -> UIView

func right() -> UIView
```
### sample

赤いViewを画面の下辺に配置します

```swift
self.declarative {
    UIView()
        .backgroundColor(.red)
        .size(width: 100, height: 100)
        .bottom()
}

```


## touch actions

自身の上にタッチアクションを受け取るViewを乗せるメソッドです
そのため`Set<UITouch>`が保持する`view`は自身ではなくなります

```swift
func touches(
        beganHandler: ((Set<UITouch>, UIEvent?) -> Void)? = nil,
        endedHandler: ((Set<UITouch>, UIEvent?) -> Void)? = nil,
        movedHandler: ((Set<UITouch>, UIEvent?) -> Void)? = nil,
        cancelledHandler: ((Set<UITouch>, UIEvent?) -> Void)? = nil,
        estimatedPropertiesUpdatedHandler: ((Set<UITouch>) -> Void)? = nil
    ) -> UIView
```

### sample

```swift
self.declarative {
    
    UIView()
        .backgroundColor(.white)
        .width(250).height(200)
        .touches(beganHandler: { touches, event in
            
            let touche = touches.first!
            let point = touche.location(in: touche.view)
            print("began: \(point)")

        }, endedHandler: { touches, event in

            let touche = touches.first!
            let point = touche.location(in: touche.view)
            print("ended: \(point)")

        }, movedHandler: { touches, event in

            let touche = touches.first!
            let point = touche.location(in: touche.view)
            print("moved: \(point)")

        }, cancelledHandler: { touches, event in

            let touche = touches.first!
            let point = touche.location(in: touche.view)
            print("cancelled: \(point)")

        }, estimatedPropertiesUpdatedHandler: { touches in

            let touche = touches.first!
            let point = touche.location(in: touche.view)
            print("estimatedPropertiesUpdated: \(point)")

        })
        .center()
}
```
## drawing graphics

`UIBezierPath`による描画の記述をする静的メソッドです  
`HelperPathView`は内部でパスの描画をするUIViewのサブクラスです

```swift
static func path(_ imperativeBezierPath: @escaping () -> Void) -> HelperPathView
```

### sample

```swift
self.declarative {
    UIView.path {
        UIBezierPath.imperative {
            $0.move(to: .init(x: 100, y: 100))
            $0.addLine(to: .init(x: 300, y: 300))
        }.stroke(.black, lineWidth: 10)

        UIBezierPath.imperative {
            $0.move(to: .init(x: 300, y: 300))
            $0.addLine(to: .init(x: 100, y: 500))
        }.stroke(.red, lineWidth: 10)
    }
}
```

## constraint

`Autolayout`の制約を貼るためのメソッドです  
固定の数値を指定するものは以下の通りです  
`width`, `minWidth`, `maxWidth`に同時に矛盾する設定を入れることはできません  
`height`,`size`も同様です  

```swift
func width(_ width: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) -> Self

func minWidth(_ width: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) -> Self

func maxWidth(_ width: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) -> Self

func height(_ height: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) -> Self

func minHeight(_ height: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) -> Self

func maxHeight(_ height: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) -> Self

func size(width: CGFloat, height: CGFloat, widthPriority: UILayoutPriority = .required, heightPriority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint, NSLayoutConstraint) -> Void)? = nil) -> Self

func minSize(width: CGFloat, height: CGFloat, widthPriority: UILayoutPriority = .required, heightPriority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint, NSLayoutConstraint) -> Void)? = nil) -> Self

func maxSize(width: CGFloat, height: CGFloat, widthPriority: UILayoutPriority = .required, heightPriority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint, NSLayoutConstraint) -> Void)? = nil) -> Self
```

ふたつのViewを関連させた制約です  
`constraint`は`+-*/`をサポートしています

```swift
func widthEqual(to superview: UIView, constraint: NSLayoutDimension, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) -> Self

func heightEqual(to superview: UIView, constraint: NSLayoutDimension, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) -> Self
```

### sample

```swift
self.declarative {
    UIView()
        .width(100)
        .minWidth(100, priority: .defaultHight)
        .maxWidth(100) { constraint in 
          constraint.priority = .defaultLow
        }
        .height(100)
        .minHeight(100)
        .maxHeight(100)
        .size(width: 100, height: 100)
        .minSize(width: 100, height: 100, widthPriority: .required, heightPriority: .defaultHight)
        .maxSize(width: 100, height: 100) { (widthLayoutConstraint, heightLayoutConstraint) in 
          widthLayoutConstraint.isActive = false
          heightLayoutConstraint.priority = .required
        }
}
```

```swift
self.declarative {
  //UIStackVieのみsuperviewをsubviewに渡せます
  UIStackView { superview in
    //レイアウトが構築される前なのでsuperview.frame.widthは0となるためwidthEqualを利用する
    UIView.spacer().backgroundColor(.red)
          .widthEqual(to: superview, constraint: superview.widthAnchor / 2 + 30)
          .heightEqual(to: superview, constraint: superview.heightAnchor / 2 - 50, priority: .defaultHight) { constraint in 
            constraint.isActive = false
          }

    UIView.spacer()
  }
  .alignment(.center)
}
```