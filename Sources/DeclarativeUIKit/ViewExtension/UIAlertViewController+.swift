import UIKit

public extension UIAlertController {
    convenience init(preferredStyle: Style) {
        self.init(title: nil, message: nil, preferredStyle: preferredStyle)
    }

    convenience init(title: String?, message: String?, preferredStyle: Style, @ArrayUIAlertActionBuilder _ builder: (() -> [UIAlertAction?])) {
        self.init(title: title, message: message, preferredStyle: preferredStyle)
        builder().compactMap({$0}).forEach {
            self.addAction($0)
        }
    }

    convenience init(preferredStyle: Style, @ArrayUIAlertActionBuilder _ builder: (() -> [UIAlertAction?])) {
        self.init(title: nil, message: nil, preferredStyle: preferredStyle, builder)
    }
    
    @discardableResult
    func imperative(_ imperative: ((Self) -> Void)) -> Self {
        imperative(self)
        return self
    }

    @discardableResult
    func title(_ title: String?) -> Self {
        imperative {
            $0.title = title
        }
    }

    @discardableResult
    func message(_ message: String?) -> Self {
        imperative {
            $0.message = message
        }
    }
    
    @discardableResult
    func addAction(_ action: UIAlertAction) -> Self {
        imperative {
            $0.addAction(action)
        }
    }

    @discardableResult
    func addAction(_ builder: (() -> UIAlertAction)) -> Self {
        imperative {
            $0.addAction(builder())
        }
    }

    @discardableResult
    func addActions(@ArrayUIAlertActionBuilder _ builder: (() -> [UIAlertAction?])) -> Self {
        imperative { vc in
            builder().compactMap({$0}).forEach {
                vc.addAction($0)
            }
        }
    }
}
