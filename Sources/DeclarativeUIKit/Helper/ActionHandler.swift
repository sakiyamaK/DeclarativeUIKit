import Foundation

final class ActionHandler {
    weak var sender: AnyObject!
    private let action: (Any) -> Void
    
    init(target: Any, action: @escaping (Any) -> Void) {
        self.action = action
        objc_setAssociatedObject(target, String(arc4random()), self, .OBJC_ASSOCIATION_RETAIN)
    }
    
    init(sender: AnyObject, target: Any, action: @escaping (Any) -> Void) {
        self.sender = sender
        self.action = action
        objc_setAssociatedObject(target, String(arc4random()), self, .OBJC_ASSOCIATION_RETAIN)
    }

    @objc func invoke() { action(sender as Any) }

    static var selector: Selector { #selector(ActionHandler.invoke) }
}
