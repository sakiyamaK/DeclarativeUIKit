import UIKit

public extension UIColorWell {

    @discardableResult
    func selectedColor(_ color: UIColor?) -> Self {
        self.selectedColor = color
        return self
    }

    @discardableResult
    func supportsAlpha(_ supportsAlpha: Bool) -> Self {
        self.supportsAlpha = supportsAlpha
        return self
    }

    @discardableResult
    func title(_ title: String?) -> Self {
        self.title = title
        return self
    }
}
