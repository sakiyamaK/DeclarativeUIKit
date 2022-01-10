import UIKit.UIView

public class HelperPathView: UIView {
    private var imperativeBezierPath: (() -> Void)?

    convenience init(_ imperativeBezierPath: @escaping () -> Void) {
        self.init(frame: .zero)
        self.backgroundColor = .clear
        self.imperativeBezierPath = imperativeBezierPath
    }

    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard
        let imperativeBezierPath = imperativeBezierPath else {
            return
        }
        imperativeBezierPath()
    }
}
