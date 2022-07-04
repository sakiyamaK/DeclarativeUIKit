import UIKit.UIControl

public extension UIGestureRecognizer {
    convenience init(target: Any?, _ actionBuilder: () -> Selector?) {
        self.init(target: target, action: actionBuilder())
    }
    
    convenience init(target: Any, _ action: @escaping ((Any) -> Void)) {
        let handler = ActionHandler(target: target, action: action)
        self.init(target: handler, action: ActionHandler.selector)
        handler.sender = self
    }
}
