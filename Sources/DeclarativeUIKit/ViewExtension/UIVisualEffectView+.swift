import UIKit

public extension UIVisualEffectView {

    @discardableResult
    func effect(_ effect: UIVisualEffect?) -> Self {
        self.effect = effect
        return self
    }
}
