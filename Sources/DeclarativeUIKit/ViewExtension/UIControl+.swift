import UIKit.UIControl

public extension UIControl {
    convenience init(primaryAction: UIAction?) {
        self.init(frame: .zero, primaryAction: primaryAction)
    }

    convenience init(primaryActionHandler: @escaping UIActionHandler) {
        self.init(frame: .zero, primaryAction: .init(handler: primaryActionHandler))
    }
}

//MARK: - Declarative method
public extension UIControl {
    
    @discardableResult
    func isEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }

    @discardableResult
    func isSelected(_ isSelected: Bool) -> Self {
        self.isSelected = isSelected
        return self
    }

    @discardableResult
    func isHighlighted(_ isHighlighted: Bool) -> Self {
        self.isHighlighted = isHighlighted
        return self
    }

    @discardableResult
    func contentVerticalAlignment(_ contentVerticalAlignment: UIControl.ContentVerticalAlignment) -> Self {
        self.contentVerticalAlignment = contentVerticalAlignment
        return self
    }

    @discardableResult
    func contentHorizontalAlignment(_ contentHorizontalAlignment: UIControl.ContentHorizontalAlignment) -> Self {
        self.contentHorizontalAlignment = contentHorizontalAlignment
        return self
    }
}

public extension UIControl {
    @discardableResult
    func isContextMenuInteractionEnabled(_ isContextMenuInteractionEnabled: Bool) -> Self {
        self.isContextMenuInteractionEnabled = isContextMenuInteractionEnabled
        return self
    }

    @discardableResult
    func showsMenuAsPrimaryAction(_ showsMenuAsPrimaryAction: Bool) -> Self {
        self.showsMenuAsPrimaryAction = showsMenuAsPrimaryAction
        return self
    }

    @discardableResult
    func addAction(_ controlEvents: UIControl.Event, handler: @escaping UIActionHandler) -> Self {
        self.addAction(.init(handler: handler), for: controlEvents)
        return self
    }
}

public extension UIControl {
    @discardableResult
    func toolTip(_ toolTip: String?) -> Self {
        self.toolTip = toolTip
        return self
    }
}

@available(iOS 17.0, *)
public extension UIControl {
    @discardableResult
    func isSymbolAnimationEnabled(_ isSymbolAnimationEnabled: Bool) -> Self {
        self.isSymbolAnimationEnabled = isSymbolAnimationEnabled
        return self
    }
}

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
}
