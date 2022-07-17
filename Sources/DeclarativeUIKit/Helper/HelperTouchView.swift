import UIKit.UIView

class HelperTouchView: UIView {
    
    var touchesBeganHandler: ((Set<UITouch>, UIEvent?) -> Void)?
    var touchesEndedHandler: ((Set<UITouch>, UIEvent?) -> Void)?
    var touchesMovedHandler: ((Set<UITouch>, UIEvent?) -> Void)?
    var touchesCancelledHandler: ((Set<UITouch>, UIEvent?) -> Void)?
    var touchesEstimatedPropertiesUpdatedHandler: ((Set<UITouch>) -> Void)?

    convenience init(
        touchesBeganHandler: ((Set<UITouch>, UIEvent?) -> Void)?,
        touchesEndedHandler: ((Set<UITouch>, UIEvent?) -> Void)?,
        touchesMovedHandler: ((Set<UITouch>, UIEvent?) -> Void)?,
        touchesCancelledHandler: ((Set<UITouch>, UIEvent?) -> Void)?,
        touchesEstimatedPropertiesUpdatedHandler: ((Set<UITouch>) -> Void)?
    ) {
        self.init(frame: .zero)
        self.backgroundColor = .clear
        self.isUserInteractionEnabled = true
        self.touchesBeganHandler = touchesBeganHandler
        self.touchesEndedHandler = touchesEndedHandler
        self.touchesMovedHandler = touchesMovedHandler
        self.touchesCancelledHandler = touchesCancelledHandler
        self.touchesEstimatedPropertiesUpdatedHandler = touchesEstimatedPropertiesUpdatedHandler
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        touchesBeganHandler?(touches, event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        touchesEndedHandler?(touches, event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        touchesMovedHandler?(touches, event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        touchesCancelledHandler?(touches, event)
    }
    
    override func touchesEstimatedPropertiesUpdated(_ touches: Set<UITouch>) {
        super.touchesEstimatedPropertiesUpdated(touches)
        touchesEstimatedPropertiesUpdatedHandler?(touches)
    }
}
