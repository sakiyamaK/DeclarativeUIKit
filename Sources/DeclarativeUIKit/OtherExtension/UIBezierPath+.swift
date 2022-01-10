import UIKit.UIBezierPath

public extension UIBezierPath {
    @discardableResult
    static func imperative(_ imperative: ((Self) -> Void)) -> Self {
        Self().imperative(imperative)
    }

    @discardableResult
    func imperative(_ imperative: (Self) -> Void) -> Self {
        imperative(self)
        return self
    }

    @discardableResult
    func stroke(_ color: UIColor, lineWidth: CGFloat) -> Self {
        color.setStroke()
        self.lineWidth = lineWidth
        self.stroke()
        return self
    }

}
