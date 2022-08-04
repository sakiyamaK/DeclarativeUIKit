import UIKit.UIButton

//MARK: -
public extension UIButton {
    convenience init(_ title: String?) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }

    convenience init(_ title: String?, for: UIControl.State) {
        self.init(frame: .zero)
        self.setTitle(title, for: `for`)
    }

    convenience init(for: UIControl.State, _ titleBuilder: () -> String?) {
        self.init(frame: .zero)
        let title = titleBuilder()
        self.setTitle(title, for: `for`)
    }

    convenience init(_ image: UIImage?) {
        self.init(frame: .zero)
        self.setImage(image, for: .normal)
    }

    convenience init(_ image: UIImage?, for: UIControl.State) {
        self.init(frame: .zero)
        self.setImage(image, for: `for`)
    }

    convenience init(for: UIControl.State, _ imageBuilder: () -> UIImage?) {
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
