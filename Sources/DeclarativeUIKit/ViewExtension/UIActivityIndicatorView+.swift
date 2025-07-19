import UIKit

public extension UIActivityIndicatorView {

    @discardableResult
    func style(_ style: UIActivityIndicatorView.Style) -> Self {
        self.style = style
        return self
    }

    @discardableResult
    func hidesWhenStopped(_ hidesWhenStopped: Bool) -> Self {
        self.hidesWhenStopped = hidesWhenStopped
        return self
    }

    @discardableResult
    func color(_ color: UIColor?) -> Self {
        self.color = color
        return self
    }
}

public extension UIActivityIndicatorView {

    @discardableResult
    func animating(_ isAnimating: Bool) -> Self {
        if isAnimating {
            self.startAnimating()
        } else {
            self.stopAnimating()
        }
        return self
    }
}
