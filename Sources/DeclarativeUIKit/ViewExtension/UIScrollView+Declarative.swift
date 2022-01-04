import UIKit.UIScrollView

public extension UIScrollView {
    
    private func constraint(axis: NSLayoutConstraint.Axis = .vertical, margin: UIEdgeInsets = .zero, view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)

        let height = view.heightAnchor.constraint(equalTo: self.frameLayoutGuide.heightAnchor, constant: -(margin.top + margin.bottom))
        let width = view.widthAnchor.constraint(equalTo: self.frameLayoutGuide.widthAnchor, constant: -(margin.left + margin.right))

        if axis == .vertical {
            height.priority = .init(rawValue: 1)
        } else {
            width.priority = .init(rawValue: 1)
        }
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.contentLayoutGuide.topAnchor, constant: margin.top),
            view.leftAnchor.constraint(equalTo: self.contentLayoutGuide.leftAnchor, constant: margin.left),
            view.rightAnchor.constraint(equalTo: self.contentLayoutGuide.rightAnchor, constant: margin.right),
            view.bottomAnchor.constraint(equalTo: self.contentLayoutGuide.bottomAnchor, constant: margin.bottom),
            width,
            height
        ])
    }
    
    convenience init(axis: NSLayoutConstraint.Axis = .vertical, margin: UIEdgeInsets = .zero, @SingleUIViewBuilder _ builder: () -> UIView) {
        self.init(frame: .zero)
        let view = builder()
        self.constraint(axis: axis, margin: margin, view: view)
    }
    
    static func vertical(
        margin: UIEdgeInsets = .zero,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> UIScrollView {
        UIScrollView(axis: .vertical, margin: margin, builder)
    }
    
    static func horizontal(
        margin: UIEdgeInsets = .zero,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> UIScrollView {
        UIScrollView(axis: .horizontal, margin: margin, builder)
    }
}

//MARK: - with superview
public extension UIScrollView {
    
    convenience init(axis: NSLayoutConstraint.Axis = .vertical, margin: UIEdgeInsets = .zero, @SingleUIViewBuilder _ builder: (UIView) -> UIView) {
        self.init(frame: .zero)        
        let view = builder(self)
        self.constraint(axis: axis, margin: margin, view: view)
    }

    static func vertical(
        margin: UIEdgeInsets = .zero,
        @SingleUIViewBuilder _ builder: (UIView) -> UIView
    ) -> UIScrollView {
        UIScrollView(axis: .vertical, margin: margin, builder)
    }
    
    static func horizontal(
        margin: UIEdgeInsets = .zero,
        @SingleUIViewBuilder _ builder: (UIView) -> UIView
    ) -> UIScrollView {
        UIScrollView(axis: .horizontal, margin: margin, builder)
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

    @discardableResult
    func refreshControl(_ refreshControl: () -> UIRefreshControl) -> Self {
        self.refreshControl = refreshControl()
        return self
    }
}
