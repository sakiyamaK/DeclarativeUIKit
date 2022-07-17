import UIKit.UIView
import UIKit.UIStackView

//自身のタッチアクションは全て透過させるが子のタッチアクションは反応させる
class HelperTouchTransparencyView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        return view == self ? nil : view
    }
}

class HelperTouchTransparencyStackView: UIStackView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        return view == self ? nil : view
    }
}

