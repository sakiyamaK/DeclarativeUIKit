import UIKit.UIImageView

//MARK: -
public extension UIImageView {
    convenience init(_ image: UIImage?) {
        self.init(frame: .zero)
        self.image = image
    }

    convenience init(_ imageBuilder: () -> UIImage?) {
        self.init(frame: .zero)
        let image = imageBuilder()
        self.image = image
    }
}

//MARK: - Declarative method
public extension UIImageView {
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }
    
    @discardableResult
    func tintColor(_ color: UIColor) -> Self {
        self.tintColor = tintColor
        return self
    }

}
