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
    
    convenience init(axis: NSLayoutConstraint.Axis = .vertical, margin: UIEdgeInsets = .zero, _ builder: @escaping () -> UIView) {
        self.init(frame: .zero)
        let view = builder()
        self.constraint(axis: axis, margin: margin, view: view)
    }
    
    convenience init(axis: NSLayoutConstraint.Axis = .vertical, margin: UIEdgeInsets = .zero, _ builderAsync: @escaping () async -> UIView) async {
        self.init(frame: .zero)
        let view = await builderAsync()
        self.constraint(axis: axis, margin: margin, view: view)
    }
    
    static func vertical(
        margin: UIEdgeInsets = .zero,
        isTouchTransparency: Bool = false,
        _ builder: @escaping () -> UIView
    ) -> UIScrollView {
        if isTouchTransparency {
            HelperTouchTransparencyScrollView(axis: .vertical, margin: margin, builder)
        } else {
            UIScrollView(axis: .vertical, margin: margin, builder)
        }
    }
    
    static func vertical(
        margin: UIEdgeInsets = .zero,
        isTouchTransparency: Bool = false,
        _ builderAsync: @escaping () async -> UIView
    ) async -> UIScrollView {
        if isTouchTransparency {
            await HelperTouchTransparencyScrollView(axis: .vertical, margin: margin, builderAsync)
        } else {
            await UIScrollView(axis: .vertical, margin: margin, builderAsync)
        }
    }
    
    static func horizontal(
        margin: UIEdgeInsets = .zero,
        isTouchTransparency: Bool = false,
        _ builder: @escaping () -> UIView
    ) -> UIScrollView {
        if isTouchTransparency {
            HelperTouchTransparencyScrollView(axis: .horizontal, margin: margin, builder)
        } else {
            UIScrollView(axis: .horizontal, margin: margin, builder)
        }
    }
}

//MARK: - with superview
public extension UIScrollView {
    
    convenience init(axis: NSLayoutConstraint.Axis = .vertical, margin: UIEdgeInsets = .zero, isTouchTransparency: Bool = false, _ builder: @escaping (UIView) async -> UIView) {
        self.init(frame: .zero)
        Task { @MainActor in
            let view = await builder(self)
            self.constraint(axis: axis, margin: margin, view: view)
        }
    }

    static func vertical(
        margin: UIEdgeInsets = .zero,
        isTouchTransparency: Bool = false,
        _ builder: @escaping (UIView) async -> UIView
    ) -> UIScrollView {
        if isTouchTransparency {
            return HelperTouchTransparencyScrollView(axis: .vertical, margin: margin, builder)
        }
        return UIScrollView(axis: .vertical, margin: margin, builder)
    }
    
    static func horizontal(
        margin: UIEdgeInsets = .zero,
        isTouchTransparency: Bool = false,
        _ builder: @escaping (UIView) async -> UIView
    ) -> UIScrollView {
        if isTouchTransparency {
            return HelperTouchTransparencyScrollView(axis: .horizontal, margin: margin, builder)
        }
        return UIScrollView(axis: .horizontal, margin: margin, builder)
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
    
    @discardableResult
    func refreshControl(_ refreshControl: UIRefreshControl) -> Self {
        self.refreshControl = refreshControl
        return self
    }

    @discardableResult
    func contentOffset(_ contentOffset: CGPoint) -> Self {
        self.contentOffset = contentOffset
        return self
    }

    @discardableResult
    func contentSize(_ contentSize: CGSize) -> Self {
        self.contentSize = contentSize
        return self
    }

    @discardableResult
    func contentInset(_ contentInset: UIEdgeInsets) -> Self {
        self.contentInset = contentInset
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func contentInsetAdjustmentBehavior(_ contentInsetAdjustmentBehavior: ContentInsetAdjustmentBehavior) -> Self {
        self.contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func automaticallyAdjustsScrollIndicatorInsets(_ automaticallyAdjustsScrollIndicatorInsets: Bool) -> Self {
        self.automaticallyAdjustsScrollIndicatorInsets = automaticallyAdjustsScrollIndicatorInsets
        return self
    }
    
    @discardableResult
    func delegate(_ delegate: UIScrollViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }

    @discardableResult
    func isDirectionalLockEnabled(_ isDirectionalLockEnabled: Bool) -> Self {
        self.isDirectionalLockEnabled = isDirectionalLockEnabled
        return self
    }

    @discardableResult
    func bounces(_ bounces: Bool) -> Self {
        self.bounces = bounces
        return self
    }

    @discardableResult
    func alwaysBounceVertical(_ alwaysBounceVertical: Bool) -> Self {
        self.alwaysBounceVertical = alwaysBounceVertical
        return self
    }

    @discardableResult
    func alwaysBounceHorizontal(_ alwaysBounceHorizontal: Bool) -> Self {
        self.alwaysBounceHorizontal = alwaysBounceHorizontal
        return self
    }

    @discardableResult
    func isPagingEnabled(_ isPagingEnabled: Bool) -> Self {
        self.isPagingEnabled = isPagingEnabled
        return self
    }

    @discardableResult
    func indicatorStyle(_ indicatorStyle: UIScrollView.IndicatorStyle) -> Self {
        self.indicatorStyle = indicatorStyle
        return self
    }
    
    @available(iOS 11.1, *)
    @discardableResult
    func verticalScrollIndicatorInsets(_ verticalScrollIndicatorInsets: UIEdgeInsets) -> Self {
        self.verticalScrollIndicatorInsets = verticalScrollIndicatorInsets
        return self
    }

    @available(iOS 11.1, *)
    @discardableResult
    func horizontalScrollIndicatorInsets(_ horizontalScrollIndicatorInsets: UIEdgeInsets) -> Self {
        self.horizontalScrollIndicatorInsets = horizontalScrollIndicatorInsets
        return self
    }

    @discardableResult
    func scrollIndicatorInsets(_ scrollIndicatorInsets: UIEdgeInsets) -> Self {
        self.scrollIndicatorInsets = scrollIndicatorInsets
        return self
    }
    
    @discardableResult
    func decelerationRate(_ decelerationRate: UIScrollView.DecelerationRate) -> Self {
        self.decelerationRate = decelerationRate
        return self
    }

    @discardableResult
    func indexDisplayMode(_ indexDisplayMode: UIScrollView.IndexDisplayMode) -> Self {
        self.indexDisplayMode = indexDisplayMode
        return self
    }

    @discardableResult
    func delaysContentTouches(_ delaysContentTouches: Bool) -> Self {
        self.delaysContentTouches = delaysContentTouches
        return self
    }

    @discardableResult
    func canCancelContentTouches(_ canCancelContentTouches: Bool) -> Self {
        self.canCancelContentTouches = canCancelContentTouches
        return self
    }

    @discardableResult
    func minimumZoomScale(_ minimumZoomScale: CGFloat) -> Self {
        self.minimumZoomScale = minimumZoomScale
        return self
    }

    @discardableResult
    func maximumZoomScale(_ maximumZoomScale: CGFloat) -> Self {
        self.maximumZoomScale = maximumZoomScale
        return self
    }

    @discardableResult
    func zoomScale(_ zoomScale: CGFloat) -> Self {
        self.zoomScale = zoomScale
        return self
    }

    @discardableResult
    func bouncesZoom(_ bouncesZoom: Bool) -> Self {
        self.bouncesZoom = bouncesZoom
        return self
    }

    @discardableResult
    func scrollsToTop(_ scrollsToTop: Bool) -> Self {
        self.scrollsToTop = scrollsToTop
        return self
    }

    @discardableResult
    func keyboardDismissMode(_ keyboardDismissMode: UIScrollView.KeyboardDismissMode) -> Self {
        self.keyboardDismissMode = keyboardDismissMode
        return self
    }
}
