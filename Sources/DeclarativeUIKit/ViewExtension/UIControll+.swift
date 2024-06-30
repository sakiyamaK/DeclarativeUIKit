import UIKit.UIControl

//MARK: - Declarative method
public extension UIControl {
    @discardableResult
    @available(iOS, deprecated: 14.0, message: "This function is deprecated. Use addAction instead")
    func add(target: Any?, action: Selector, for controlEvents: UIControl.Event) -> Self {
        self.addTarget(target, action: action, for: controlEvents)
        return self
    }
    
    @discardableResult
    @available(iOS, deprecated: 14.0, message: "This function is deprecated. Use addAction instead")
    func add(target: Any?, for controlEvents: UIControl.Event, _ actionBuilder: () -> Selector) -> Self {
        self.add(target: target, action: actionBuilder(), for: controlEvents)
    }
        
    @discardableResult
    @available(iOS, deprecated: 14.0, message: "This function is deprecated. Use addAction instead")
    func addControlAction(target: Any?, for controlEvents: UIControl.Event, _ actionBuilder: () -> Selector) -> Self {
        self.add(target: target, action: actionBuilder(), for: controlEvents)
    }

    @discardableResult
    @available(iOS, deprecated: 14.0, message: "This function is deprecated. Use addAction instead")
    func add(target: Any, for controlEvents: UIControl.Event, _ action: @escaping ((Any) -> Void)) -> Self {
        let handler = ActionHandler(sender: self, target: target, action: action)
        self.add(target: handler, action: ActionHandler.selector, for: controlEvents)
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func addAction(_ controlEvents: UIControl.Event, handler: @escaping UIActionHandler) -> Self {
        self.addAction(.init(handler: handler), for: controlEvents)
        return self
    }
}
