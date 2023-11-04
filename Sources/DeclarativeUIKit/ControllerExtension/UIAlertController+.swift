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
    func apply(_ apply: ((Self) -> Void)) -> Self {
        apply(self)
        return self
    }

    @discardableResult
    func title(_ title: String?) -> Self {
        self.title = title
        return self
    }

    @discardableResult
    func message(_ message: String?) -> Self {
        self.message = message
        return self
    }
    
    @discardableResult
    func addAction(_ builder: (() -> UIAlertAction)) -> Self {
        self.addAction(builder())
        return self
    }

    @discardableResult
    func addActions(@ArrayUIAlertActionBuilder _ builder: (() -> [UIAlertAction?])) -> Self {
        builder().compactMap({$0}).forEach {[weak self] action in
            self?.addAction(action)
        }
        return self
    }

    @discardableResult
    func addPreferredAction(_ builder: (() -> UIAlertAction)) -> Self {
        let action = builder()
        self.addAction {
            action
        }
        self.preferredAction = action
        return self
    }
    
    @discardableResult
    func addTextField(withHandler: @escaping ((UITextField) -> Void)) -> Self {
        guard self.preferredStyle == .alert else {
            debugPrint("TextField can not add, if preferredStyle is not alert")
            return self
        }
        self.addTextField(configurationHandler: withHandler)
        return self
    }
}
