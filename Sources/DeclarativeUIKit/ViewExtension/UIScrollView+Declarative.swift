import UIKit.UIScrollView

public extension UIScrollView {
    
    static private func create(
        axis: NSLayoutConstraint.Axis = .vertical,
        margin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> UIScrollView {
        UIScrollView {
            guard let scrollView = $0 as? UIScrollView else { return }
            let view = builder()
            view.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(view)
            
            let height = view.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor, constant: -(margin.top + margin.bottom))
            let width = view.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, constant: -(margin.left + margin.right))

            if axis == .vertical {
                height.priority = .init(rawValue: 1)
            } else {
                width.priority = .init(rawValue: 1)
            }
            
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: margin.top),
                view.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor, constant: margin.left),
                scrollView.contentLayoutGuide.rightAnchor.constraint(equalTo: view.rightAnchor, constant: margin.right),
                scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: margin.top),
                width,
                height
            ])
        }
    }
    
    static func vertical(
        margin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> UIScrollView {
        UIScrollView.create(axis: .vertical, margin: margin, builder)
    }
    
    static func horizontal(
        margin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> UIScrollView {
        UIScrollView.create(axis: .horizontal, margin: margin, builder)
    }
}

//MARK: - with superview
public extension UIScrollView {
    
    static private func create(
        axis: NSLayoutConstraint.Axis = .vertical,
        margin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
        @SingleUIViewBuilder _ builder: (UIView) -> UIView
    ) -> UIScrollView {
        UIScrollView {
            guard let scrollView = $0 as? UIScrollView else { return }
            let view = builder(scrollView)
            view.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(view)
            
            let height = view.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor, constant: -(margin.top + margin.bottom))
            let width = view.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, constant: -(margin.left + margin.right))

            if axis == .vertical {
                height.priority = .init(rawValue: 1)
            } else {
                width.priority = .init(rawValue: 1)
            }
            
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: margin.top),
                view.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor, constant: margin.left),
                scrollView.contentLayoutGuide.rightAnchor.constraint(equalTo: view.rightAnchor, constant: margin.right),
                scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: margin.top),
                width,
                height
            ])
        }
    }
    
    static func vertical(
        margin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
        @SingleUIViewBuilder _ builder: (UIView) -> UIView
    ) -> UIScrollView {
        UIScrollView.create(axis: .vertical, margin: margin, builder)
    }
    
    static func horizontal(
        margin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
        @SingleUIViewBuilder _ builder: (UIView) -> UIView
    ) -> UIScrollView {
        UIScrollView.create(axis: .horizontal, margin: margin, builder)
    }
}

//MARK: - Declarative Parameters
public extension UIScrollView {
    @discardableResult
    func isScrollEnabled(_ isScrollEnabled: Bool) -> Self {
        self.isScrollEnabled = isScrollEnabled
        return self
    }
    
    @discardableResult
    func showsVerticalScrollIndicator(_ showsVerticalScrollIndicator: Bool) -> Self {
        self.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        return self
    }
    
    @discardableResult
    func showsHorizontalScrollIndicator(_ showsHorizontalScrollIndicator: Bool) -> Self {
        self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        return self
    }
    
    @discardableResult
    func showsScrollIndicator(_ showsScrollIndicator: Bool) -> Self {
        self.showsVerticalScrollIndicator = showsScrollIndicator
        self.showsHorizontalScrollIndicator = showsScrollIndicator
        return self
    }

}
