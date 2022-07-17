# UIBezierPath

## function

### imperative

Methods to implement `UIBezierPath` parameters procedurally as standard.

```swift
func imperative(_ imperative: ((Self) -> Void)) -> Self

static func imperative(_ imperative: ((Self) -> Void)) -> Self
```

### storke

A method to draw a line with a specified color and thickness.

```swift
func stroke(_ color: UIColor, lineWidth: CGFloat) -> Self
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| color | UIColor | line color |
| lineWidth | CGFloat | line thickness |

#### sample

```swift
self.declarative {
    UIStackView { superview in
        UIView.path {
            
            let size = superview.frame.size

            UIBezierPath().imperative {
                $0.move(to: CGPoint(x: 0, y: size.height))
                $0.addLine(to: CGPoint(x: size.width, y: 0))
            }.stroke(.green, lineWidth: 10)

            UIBezierPath.imperative {
                $0.move(to: CGPoint(x: 0, y: 0))
                $0.addLine(to: CGPoint(x: size.width, y: size.height))
            }.stroke(.red, lineWidth: 10)

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
