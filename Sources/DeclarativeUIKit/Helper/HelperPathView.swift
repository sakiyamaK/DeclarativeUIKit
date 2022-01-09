import UIKit.UIView

public class HelperPathView: UIView {
    private var bezierPath: UIBezierPath?
    private var strokeColor: UIColor = .clear
    private var lineWidth: CGFloat = 0
    private var imperativeBezierPath: ((UIBezierPath) -> Void)?

    convenience init(_ bezierPath: UIBezierPath, _ imperativeBezierPath: @escaping (UIBezierPath) -> Void) {
        self.init(frame: .zero)
        self.backgroundColor = .clear
        self.bezierPath = bezierPath
        self.imperativeBezierPath = imperativeBezierPath
    }

    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard
            let bezierPath = bezierPath,
        let imperativeBezierPath = imperativeBezierPath else {
            return
        }
        imperativeBezierPath(bezierPath)
        strokeColor.setStroke()
        bezierPath.stroke()
    }
}

public extension HelperPathView {
    @discardableResult
    func stroke(_ color: UIColor, lineWidth: CGFloat) -> Self {
        strokeColor = color
        bezierPath?.lineWidth = lineWidth
        return self
    }
}

public extension UIBezierPath {
    convenience init(_ imperative: (UIBezierPath) -> Void) {
        self.init()
        imperative(self)
    }
}
