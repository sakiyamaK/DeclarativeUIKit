import UIKit

@available(iOS 17.0, *)
public extension UIContentUnavailableView {

    @discardableResult
    func configuration(_ configuration: UIContentUnavailableConfiguration) -> Self {
        self.configuration = configuration
        return self
    }
}
