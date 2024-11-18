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
    func titleShadowColor(_ color: UIColor?) -> Self {
        self.titleShadowColor(color, for: .normal)
    }

    @discardableResult
    func titleShadowColor(_ color: UIColor?, for state: UIControl.State) -> Self {
        self.setTitleShadowColor(color, for: state)
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

    @discardableResult
    func backgroundImage(_ image: UIImage?) -> Self {
        self.backgroundImage(image, for: .normal)
    }

    @discardableResult
    func backgroundImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        self.setBackgroundImage(image, for: state)
        return self
    }

    @discardableResult
    func preferredSymbolConfiguration(_ configuration: UIImage.SymbolConfiguration?) -> Self {
        self.preferredSymbolConfiguration(configuration, forImageIn: .normal)
    }

    @discardableResult
    func preferredSymbolConfiguration(_ configuration: UIImage.SymbolConfiguration?, forImageIn state: UIControl.State) -> Self {
        self.setPreferredSymbolConfiguration(configuration, forImageIn: state)
        return self
    }
    
    @discardableResult
    func font(_ font: UIFont?) -> Self {
        self.titleLabel?.font = font
        return self
    }
}

//MARK: - available iOS 14.0
@available(iOS 14.0, *)
public extension UIButton {
    @discardableResult
    func menu(_ menu: UIMenu) -> Self {
        self.menu = menu
        return self
    }    
}

//MARK: - available iOS 15.0
@available(iOS 15.0, *)
public extension UIButton {
    convenience init(configurationBuilder: (() -> UIButton.Configuration), primaryAction: UIAction?) {
        self.init(configuration: configurationBuilder(), primaryAction: primaryAction)
    }
    
    @discardableResult
    func configuration(_ configuration: UIButton.Configuration) -> Self {
        self.configuration = configuration
        return self
    }
    
    @discardableResult
    func configuration(_ configurationBuilder: (() -> UIButton.Configuration)) -> Self {
        self.configuration = configurationBuilder()
        return self
    }
    
    @discardableResult
    func configurationUpdateHandler(_ handler: UIButton.ConfigurationUpdateHandler?) -> Self {
        self.configurationUpdateHandler = handler
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
