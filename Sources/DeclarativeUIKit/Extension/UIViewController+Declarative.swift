import UIKit.UIStackView
import UIKit.UIViewController

public extension UIViewController {
    func build(isSafeArea: Bool = true, isScrollEnabled: Bool = true, @SingleUIViewBuilder _ builder: () -> UIView?) {
        guard let view = builder() else { return }
        self.view.subviews.forEach { $0.removeFromSuperview() }
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = isScrollEnabled
        self.view.edgesConstraints(scrollView, isSafeArea: isSafeArea)
        scrollView.addSubview(view)
        let height = view.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor)
        height.priority = .init(rawValue: 1)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            view.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor),
            scrollView.contentLayoutGuide.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            view.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            height
        ])
    }
}
