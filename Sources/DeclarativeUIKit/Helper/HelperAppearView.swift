
import UIKit

@MainActor
final class HelperAppearView<T: UIView>: UIView {
    private(set) var onAppear: ((T) -> Void)?

    init(onAppear: ((T) -> Void)?) {
        self.onAppear = onAppear
        super.init(frame: .zero)
        self.isHidden = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        // superviewだと型が合わせられない
        if window != nil, let superview = superview as? T {
            onAppear?(superview)
            onAppear = nil
            removeFromSuperview()
        }
    }
}

// customSpacingと違ってonAppearクロージャで自身の型を送る必要があるためprotocol extensionで実装している
@MainActor
public protocol OnAppearable {}
@MainActor
public extension OnAppearable where Self: UIView {
    @discardableResult
    func onAppear(_ onAppear: @escaping (Self) -> Void) -> Self {
        self.zStack {
            HelperAppearView(onAppear: onAppear)
        }
    }
}
extension UIView: OnAppearable {}
