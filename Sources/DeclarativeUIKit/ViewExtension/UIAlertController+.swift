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
}

//MARK: - Declarative method
public extension UIAlertController {
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

    @discardableResult
    func addPreferredAction(_ builder: (() -> UIAlertAction)) -> Self {
        imperative {
            let action = builder()
            $0.addAction {
                action
            }
            $0.preferredAction = action
        }
    }
    
    @discardableResult
    func addTextField(withHandler: @escaping ((UITextField) -> Void)) -> Self {
        imperative {
            guard $0.preferredStyle == .alert else {
                debugPrint("TextField can not add, if preferredStyle is not alert")
                return
            }
            $0.addTextField(configurationHandler: withHandler)
        }
    }
}
