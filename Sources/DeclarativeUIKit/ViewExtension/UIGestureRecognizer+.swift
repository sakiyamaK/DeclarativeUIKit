import UIKit.UIControl

public extension UIGestureRecognizer {
    convenience init(target: Any?, _ actionBuilder: () -> Selector?) {
        self.init(target: target, action: actionBuilder())
    }
}

