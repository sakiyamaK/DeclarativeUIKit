import UIKit.UISwitch

// MARK: -
public extension UISwitch {
    convenience init(_ frame: CGRect = .zero, _ apply: (Self) -> Void) {
        self.init(frame: .zero)
        apply(self)
    }
}

// MARK: - Declarative method
public extension UISwitch {

    @discardableResult
    func isOn(_ isOn: Bool) -> Self {
        self.isOn = isOn
        return self
    }

    @discardableResult
    func preferredStyle(_ preferredStyle: UISwitch.Style) -> Self {
        self.preferredStyle = preferredStyle
        return self
    }

    @discardableResult
    func title(_ title: String?) -> Self {
        self.title = title
        return self
    }

    @discardableResult
    func onTintColor(_ onTintColor: UIColor?) -> Self {
        self.onTintColor = onTintColor
        return self
    }

    @discardableResult
    func thumbTintColor(_ thumbTintColor: UIColor?) -> Self {
        self.thumbTintColor = thumbTintColor
        return self
    }

    @discardableResult
    func onImage(_ onImage: UIImage?) -> Self {
        self.onImage = onImage
        return self
    }

    @discardableResult
    func offImage(_ offImage: UIImage?) -> Self {
        self.offImage = offImage
        return self
    }
}
