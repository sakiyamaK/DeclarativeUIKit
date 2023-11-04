import UIKit.UIBezierPath

public extension UIBezierPath {
    @discardableResult
    static func apply(_ apply: ((Self) -> Void)) -> Self {
        Self().apply(apply)
    }

    @discardableResult
    func stroke(_ color: UIColor, lineWidth: CGFloat) -> Self {
        color.setStroke()
        self.lineWidth = lineWidth
        self.stroke()
        return self
    }

}
