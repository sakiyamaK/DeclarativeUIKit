import UIKit.UIButton

//MARK: -
public extension UIButton {

    convenience init(_ title: String?, for: UIControl.State = .normal) {
        self.init(frame: .zero)
        self.title(title, for: `for`)
    }
    
    convenience init(_ title: NSAttributedString?, for: UIControl.State = .normal) {
        self.init(frame: .zero)
        self.title(title, for: `for`)
    }

    convenience init(for: UIControl.State = .normal, _ titleBuilder: () -> String?) {
        self.init(frame: .zero)
        let title = titleBuilder()
        self.title(title, for: `for`)
    }

    convenience init(for: UIControl.State = .normal, _ titleBuilder: () -> NSAttributedString?) {
        self.init(frame: .zero)
        let title = titleBuilder()
        self.title(title, for: `for`)
    }

    convenience init(_ image: UIImage?, for: UIControl.State = .normal) {
        self.init(frame: .zero)
        self.setImage(image, for: `for`)
    }

    convenience init(for: UIControl.State = .normal, _ imageBuilder: () -> UIImage?) {
        self.init(frame: .zero)
        let image = imageBuilder()
        self.setImage(image, for: `for`)
    }
}

//MARK: - Declarative method
public extension UIButton {

    @discardableResult
    func title(_ title: String?) -> Self {
        self.title(title, for: .normal)
    }

    @discardableResult
    func title(_ title: String?, for: UIControl.State) -> Self {
        self.setTitle(title, for: `for`)
        return self
    }
    
    @discardableResult
    func title(_ title: NSAttributedString?) -> Self {
        self.title(title, for: .normal)
    }

    @discardableResult
    func title(_ title: NSAttributedString?, for: UIControl.State) -> Self {
        self.setAttributedTitle(title, for: `for`)
        return self
    }

    @discardableResult
    func titleColor(_ color: UIColor?) -> Self {
        self.titleColor(color, for: .normal)
    }

    @discardableResult
    func titleColor(_ color: UIColor?, for: UIControl.State) -> Self {
        self.setTitleColor(color, for: `for`)
        return self
    }
    
    @discardableResult
    func font(_ font: UIFont?) -> Self {
        self.titleLabel?.font = font
        return self
    }
    
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        self.image(image, for: .normal)
    }

    @discardableResult
    func image(_ image: UIImage?, for: UIControl.State) -> Self {
        self.setImage(image, for: `for`)
        return self
    }
}

//MARK: - available iOS 14.0
@available(iOS 14.0, *)
public extension UIButton {
    func menu(_ menu: UIMenu) -> Self {
        self.menu = menu
        return self
    }
    
    func showsMenuAsPrimaryAction(_ showsMenuAsPrimaryAction: Bool) -> Self {
        self.showsMenuAsPrimaryAction = showsMenuAsPrimaryAction
        return self
    }
}

//MARK: - Declarative method
@available(iOS, deprecated: 15.0, message: "This property is ignored when using UIButtonConfiguration")
public extension UIButton {
    @discardableResult
    func contentEdgeInsets(_ contentEdgeInsets: UIEdgeInsets) -> Self {
        self.contentEdgeInsets = contentEdgeInsets
        return self
    }

    @discardableResult
    func titleEdgeInsets(_ titleEdgeInsets: UIEdgeInsets) -> Self {
        self.titleEdgeInsets = titleEdgeInsets
        return self
    }

    @discardableResult
    func imageEdgeInsets(_ imageEdgeInsets: UIEdgeInsets) -> Self {
        self.imageEdgeInsets = imageEdgeInsets
        return self
    }
}
