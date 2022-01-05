import UIKit.UIControl

//MARK: - Declarative method
public extension UIControl {
    @discardableResult
    func add(target: Any?, action: Selector, for controlEvents: UIControl.Event) -> Self {
        self.addTarget(target, action: action, for: controlEvents)
        return self
    }
}
