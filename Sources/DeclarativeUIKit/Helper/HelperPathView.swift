import UIKit.UIView

public class HelperPathView: UIView {
    private var applyBezierPath: (() -> Void)?

    convenience init(_ applyBezierPath: @escaping () -> Void) {
        self.init(frame: .zero)
        self.backgroundColor = .clear
        self.applyBezierPath = applyBezierPath
    }

    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard
        let applyBezierPath = applyBezierPath else {
            return
        }
        applyBezierPath()
    }
}
