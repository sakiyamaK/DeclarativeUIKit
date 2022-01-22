# UIBezierPath

## function

### imperative

`UIBezierPath`のパラメータを標準の通り手続的に実装するメソッドです

```swift
func imperative(_ imperative: ((Self) -> Void)) -> Self

static func imperative(_ imperative: ((Self) -> Void)) -> Self
```

### storke

指定した色と太さで線を引くメソッドです

```swift
func stroke(_ color: UIColor, lineWidth: CGFloat) -> Self
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| color | UIColor | 線の色 |
| lineWidth | CGFloat | 線の太さ |

#### sample

```swift
self.declarative {
    UIStackView { superview in
        UIView.path {
            
            let size = superview.frame.size

            //宣言的に書けるよ
            UIBezierPath().imperative {
                $0.move(to: CGPoint(x: 0, y: size.height))
                $0.addLine(to: CGPoint(x: size.width, y: 0))
            }.stroke(.green, lineWidth: 10)

            //いくらでも増やせるよ
            UIBezierPath.imperative {
                $0.move(to: CGPoint(x: 0, y: 0))
                $0.addLine(to: CGPoint(x: size.width, y: size.height))
            }.stroke(.red, lineWidth: 10)

            //既存の書き方でもいいよ
            let path = UIBezierPath()
            path.move(to: CGPoint(x: size.width/2, y: 0))
            path.addLine(to: CGPoint(x: size.width/2, y: size.height))
            UIColor.blue.setStroke()
            path.lineWidth = 10
            path.stroke()
            
        }
    }.distribution(.fillEqually)
}
```
