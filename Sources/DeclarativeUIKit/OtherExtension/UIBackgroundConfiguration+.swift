import UIKit

@available(iOS 14.0, *)
public extension UIBackgroundConfiguration {
    @discardableResult
    func strokeColor(_ value: UIColor) -> Self {
        var _self = self
        _self.strokeColor = value
        return _self
    }
    
    @discardableResult
    func strokeWidth(_ value: CGFloat) -> Self {
        var _self = self
        _self.strokeWidth = value
        return _self
    }
    
    @discardableResult
    func backgroundColor(_ backgroundColor: UIColor) -> Self {
        var _self = self
        _self.backgroundColor = backgroundColor
        return _self
    }
    
    @discardableResult
    func cornerRadius(_ cornerRadius: CGFloat) -> Self {
        var _self = self
        _self.cornerRadius = cornerRadius
        return _self
    }
}
