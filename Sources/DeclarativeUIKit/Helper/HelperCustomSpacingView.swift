import UIKit.UIView

final class HelperCustomSpacingView: UIView {
    private(set) var customSpacing: CGFloat = 0
    convenience init(customSpacing: CGFloat = 0) {
        self.init(frame: .zero)
        self.customSpacing = customSpacing
        self.isHidden = true
    }
}

public extension UIView {
    @discardableResult
    func customSpacing(_ customSpacing: CGFloat) -> Self {
        self.zStack {
            HelperCustomSpacingView(customSpacing: customSpacing)
        }
    }
}
