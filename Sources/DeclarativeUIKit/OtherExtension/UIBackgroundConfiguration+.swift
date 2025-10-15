import UIKit

public extension UIBackgroundConfiguration {
    
    @discardableResult
    func customView(_ value: UIView?) -> Self {
        var _self = self
        _self.customView = value
        return _self
    }
    
    @discardableResult
    func cornerRadius(_ cornerRadius: CGFloat) -> Self {
        var _self = self
        _self.cornerRadius = cornerRadius
        return _self
    }
    
    @discardableResult
    func backgroundInsets(_ value: NSDirectionalEdgeInsets) -> Self {
        var _self = self
        _self.backgroundInsets = value
        return _self
    }

    @discardableResult
    func edgesAddingLayoutMarginsToBackgroundInsets(_ value: NSDirectionalRectEdge) -> Self {
        var _self = self
        _self.edgesAddingLayoutMarginsToBackgroundInsets = value
        return _self
    }

    @discardableResult
    func backgroundColor(_ value: UIColor?) -> Self {
        var _self = self
        _self.backgroundColor = value
        return _self
    }
    
    @discardableResult
    func backgroundColorTransformer(_ value: UIConfigurationColorTransformer?) -> Self {
        var _self = self
        _self.backgroundColorTransformer = value
        return _self
    }

    @discardableResult
    func visualEffect(_ value: UIVisualEffect?) -> Self {
        var _self = self
        _self.visualEffect = value
        return _self
    }

    @discardableResult
    func image(_ value: UIImage?) -> Self {
        var _self = self
        _self.image = value
        return _self
    }

    @discardableResult
    func imageContentMode(_ value: UIView.ContentMode) -> Self {
        var _self = self
        _self.imageContentMode = value
        return _self
    }

    @discardableResult
    func strokeColor(_ value: UIColor?) -> Self {
        var _self = self
        _self.strokeColor = value
        return _self
    }

    @discardableResult
    func strokeColorTransformer(_ value: UIConfigurationColorTransformer?) -> Self {
        var _self = self
        _self.strokeColorTransformer = value
        return _self
    }

    @discardableResult
    func strokeWidth(_ value: CGFloat) -> Self {
        var _self = self
        _self.strokeWidth = value
        return _self
    }

    @discardableResult
    func strokeOutset(_ value: CGFloat) -> Self {
        var _self = self
        _self.strokeOutset = value
        return _self
    }
}
