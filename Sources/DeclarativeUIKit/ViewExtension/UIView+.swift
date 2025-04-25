import UIKit.UIView

//MARK: - instance
public extension UIView {
    
    convenience init(tag: Int = 0) {
        self.init()
        self.tag = tag
    }
    
    convenience init<T>(assign variable: inout T) {
        self.init()
        self.assign(to: &variable)
    }
    
    @discardableResult
    static func spacer() -> UIView {
        UIView().apply {
            $0.isUserInteractionEnabled = false
        }
    }
    
    @discardableResult
    static func divider() -> UIView {
        UIView.spacer().height(0.5).backgroundColor(.lightGray)
    }
    
    @discardableResult
    static func path(_ applyBezierPath: @escaping (CGRect) -> Void) -> HelperPathView {
        HelperPathView(applyBezierPath)
    }
}

//MARK: - Declarative method

@available(iOS 15.0, *)
public extension UIView {
    @discardableResult
    func declarative(
        layoutGuides: UIEdgeLayoutGuides,
        priorities: UIEdgePriorities = .init(),
        reset: Bool = false,
        _ builderAsync: @escaping () async -> UIView
    ) async -> Self {
        let view = await builderAsync()
        if reset {
            self.subviews.forEach { $0.removeFromSuperview() }
        }
        self.edgesConstraints(
            view,
            layoutGuides: layoutGuides,
            priorities: priorities
        )
        return self
    }

    @discardableResult
    func declarative(
        layoutGuides: UIEdgeLayoutGuides,
        priorities: UIEdgePriorities = .init(),
        reset: Bool = false,
        _ builder: () -> UIView
    ) -> Self {
        let view = builder()
        if reset {
            self.subviews.forEach { $0.removeFromSuperview() }
        }
        self.edgesConstraints(
            view,
            layoutGuides: layoutGuides,
            priorities: priorities
        )
        return self
    }

    @discardableResult
    func zStack(
        layoutGuides: UIEdgeLayoutGuides,
        margin: UIEdgeInsets = .zero,
        priorities: UIEdgePriorities = .init(all: .required),
        @ArrayUIViewBuilder _ builderAsync: () async -> [UIView?]
    ) async -> Self {
        await builderAsync()
            .compactMap({$0})
            .forEach { (view) in
                self.edgesConstraints(
                    view,
                    margin: margin,
                    layoutGuides: layoutGuides,
                    priorities: priorities
                )
        }
        return self
    }

    @discardableResult
    func zStack(
        layoutGuides: UIEdgeLayoutGuides,
        margin: UIEdgeInsets = .zero,
        priorities: UIEdgePriorities = .init(
            all: .required
        ),
        @ArrayUIViewBuilder _ builder: () -> [UIView?]
    ) -> Self {
        builder().compactMap({$0}).forEach { (view) in
            self.edgesConstraints(
                view,
                margin: margin,
                layoutGuides: layoutGuides,
                priorities: priorities
            )
        }
        return self
    }

    @discardableResult
    func addSubview(
        layoutGuides: UIEdgeLayoutGuides,
        margin: UIEdgeInsets = .zero,
        priorities: UIEdgePriorities = .init(all: .required),
        @ArrayUIViewBuilder _ builderAsync: () async -> [UIView?]
    ) async -> Self {
        await self.zStack(
            layoutGuides: layoutGuides,
            margin: margin,
            priorities: priorities,
            builderAsync
        )
    }

    @discardableResult
    func addSubview(
        layoutGuides: UIEdgeLayoutGuides,
        margin: UIEdgeInsets = .zero,
        priorities: UIEdgePriorities = .init(all: .required),
        @ArrayUIViewBuilder _ builder: () -> [UIView?]
    ) -> Self {
        self.zStack(
            layoutGuides: layoutGuides,
            margin: margin,
            priorities: priorities,
            builder
        )
    }
}

public extension UIView {
    @discardableResult
    func declarative(priorities: UIEdgePriorities = .init(), reset: Bool = false, _ builderAsync: @escaping () async -> UIView) async -> Self {
        let view = await builderAsync()
        if reset {
            self.subviews.forEach { $0.removeFromSuperview() }
        }
        self.edgesConstraints(view, safeAreas: .init(all: false), priorities: priorities)
        return self
    }

    @discardableResult
    func declarative(priorities: UIEdgePriorities = .init(), reset: Bool = false, _ builder: () -> UIView) -> Self {
        let view = builder()
        if reset {
            self.subviews.forEach { $0.removeFromSuperview() }
        }
        self.edgesConstraints(view, safeAreas: .init(all: false), priorities: priorities)
        return self
    }

    @discardableResult
    func zStack(margin: UIEdgeInsets = .zero, priorities: UIEdgePriorities = .init(all: .required),
                @ArrayUIViewBuilder _ builderAsync: () async -> [UIView?]) async -> Self {
        await builderAsync().compactMap({$0}).forEach { (view) in
            self.edgesConstraints(view, margin: margin, safeAreas: .init(all: false), priorities: priorities)
        }
        return self
    }

    @discardableResult
    func zStack(margin: UIEdgeInsets = .zero, priorities: UIEdgePriorities = .init(all: .required),
                @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> Self {
        builder().compactMap({$0}).forEach { (view) in
            self.edgesConstraints(view, margin: margin, safeAreas: .init(all: false), priorities: priorities)
        }
        return self
    }

    @discardableResult
    func addSubview(margin: UIEdgeInsets = .zero, priorities: UIEdgePriorities = .init(all: .required),
                    @ArrayUIViewBuilder _ builderAsync: () async -> [UIView?]) async -> Self {
        await self.zStack(margin: margin, priorities: priorities, builderAsync)
    }

    @discardableResult
    func addSubview(margin: UIEdgeInsets = .zero, priorities: UIEdgePriorities = .init(all: .required),
                    @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> Self {
        self.zStack(margin: margin, priorities: priorities, builder)
    }
}

public extension UIView {

            
    @discardableResult
    func cornerRadius(_ radius: CGFloat, maskedCorners: CACornerMask) -> Self {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = maskedCorners
        return self
    }
    
    @discardableResult
    func cornerRadius(_ radius: CGFloat) -> Self {
        cornerRadius(radius, maskedCorners: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner])
    }
    
    @discardableResult
    func border(color: UIColor, width: CGFloat) -> Self {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        return self
    }
    
    @discardableResult
    func tag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }
    
    @discardableResult
    func backgroundColor(_ backgroundColor: UIColor) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    
    @discardableResult
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        self.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    @discardableResult
    func clipsToBounds(_ clipsToBounds: Bool) -> Self {
        self.clipsToBounds = clipsToBounds
        return self
    }
    
    @discardableResult
    func contentMode(_ contentMode: ContentMode) -> Self {
        self.contentMode = contentMode
        return self
    }

    @discardableResult
    func alpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }
    
    @discardableResult
    func isHidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }
    
    @discardableResult
    func isShow(_ isShow: Bool) -> Self {
        isHidden(!isShow)
    }
    
    @discardableResult
    func shadow(color: UIColor = .black, radius: CGFloat = 0.0, x: CGFloat = 0.0, y: CGFloat = 0.0) -> Self {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: x, height: y)
        self.layer.shadowRadius = radius
        return self
    }
    
    @discardableResult
    func tintColor(_ tintColor: UIColor) -> Self {
        self.tintColor = tintColor
        return self
    }

    @discardableResult
    func isOpaque(_ isOpaque: Bool) -> Self {
        self.isOpaque = isOpaque
        return self
    }

    @discardableResult
    func clearsContextBeforeDrawing(_ clearsContextBeforeDrawing: Bool) -> Self {
        self.clearsContextBeforeDrawing = clearsContextBeforeDrawing
        return self
    }

    @discardableResult
    func mask(_ mask: UIView?) -> Self {
        self.mask = mask
        return self
    }

    @discardableResult
    func tintAdjustmentMode(_ tintAdjustmentMode: UIView.TintAdjustmentMode) -> Self {
        self.tintAdjustmentMode = tintAdjustmentMode
        return self
    }

    @discardableResult
    func add(gestureRecognizer: UIGestureRecognizer) -> Self {
        self.addGestureRecognizer(gestureRecognizer)
        return self
    }
    
    @discardableResult
    func addGestureRecognizer(_ gestureBuilder: () -> UIGestureRecognizer) -> Self {
        self.addGestureRecognizer(gestureBuilder())
        return self
    }

    @discardableResult
    func contentHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self {
        self.setContentHuggingPriority(priority, for: axis)
        return self
    }
    
    @discardableResult
    func contentCompressionResistancePriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self {
        self.setContentCompressionResistancePriority(priority, for: axis)
        return self
    }
    
    @discardableResult
    func contentPriorities(_ priorities: UIContentPriorities) -> Self {
        if let priority = priorities.huggingVertical {
            self.setContentHuggingPriority(priority, for: .vertical)
        }
        if let priority = priorities.huggingHorizontal {
            self.setContentHuggingPriority(priority, for: .horizontal)
        }
        if let priority = priorities.compressionResistanceVertical {
            self.setContentCompressionResistancePriority(priority, for: .vertical)
        }
        if let priority = priorities.compressionResistanceHorizontal {
            self.setContentCompressionResistancePriority(priority, for: .horizontal)
        }
        return self
    }
    
    @discardableResult
    func assign<T>(to variable: inout T) -> Self {
        guard let casted = self as? T else {
            assertionFailure("Can't cast \(Self.self) to \(T.self)")
            return self
        }
        
        variable = casted
        return self
    }
    
    @discardableResult
    func touches(
        beganHandler: ((Set<UITouch>, UIEvent?) -> Void)? = nil,
        endedHandler: ((Set<UITouch>, UIEvent?) -> Void)? = nil,
        movedHandler: ((Set<UITouch>, UIEvent?) -> Void)? = nil,
        cancelledHandler: ((Set<UITouch>, UIEvent?) -> Void)? = nil,
        estimatedPropertiesUpdatedHandler: ((Set<UITouch>) -> Void)? = nil
    ) -> Self {
        self.zStack {
            HelperTouchView(
                touchesBeganHandler: beganHandler,
                touchesEndedHandler: endedHandler,
                touchesMovedHandler: movedHandler,
                touchesCancelledHandler: cancelledHandler,
                touchesEstimatedPropertiesUpdatedHandler: estimatedPropertiesUpdatedHandler
            )
        }
    }
    
    @discardableResult
    func resetDeclarativeUIKitLayout() -> Self {
        self.subviews.forEach({ $0.removeFromSuperview() })
        return self
    }
    
    @discardableResult
    func layoutMargins(_ layoutMargins: UIEdgeInsets) -> Self {
        self.layoutMargins = layoutMargins
        return self
    }
    
    @discardableResult
    func directionalLayoutMargins(_ margins: NSDirectionalEdgeInsets) -> Self {
        self.directionalLayoutMargins = margins
        return self
    }

    @discardableResult
    func preservesSuperviewLayoutMargins(_ preservesSuperviewLayoutMargins: Bool) -> Self {
        self.preservesSuperviewLayoutMargins = preservesSuperviewLayoutMargins
        return self
    }

    @discardableResult
    func insetsLayoutMarginsFromSafeArea(_ insetsLayoutMarginsFromSafeArea: Bool) -> Self {
        self.insetsLayoutMarginsFromSafeArea = insetsLayoutMarginsFromSafeArea
        return self
    }
}

//MARK: - other instanse
public extension UIView {
    
    @discardableResult
    static func apply(_ apply: ((Self) -> Void)) -> Self {
        Self().apply(apply)
    }

    @discardableResult
    func padding(insets: UIEdgeInsets, touchTransparency: Bool = true, priorities: UIEdgePriorities = .init(all: .required)) -> UIView {
        if touchTransparency {
            return HelperTouchTransparencyView().zStack(margin: insets, priorities: priorities) { self }
        } else {
            return UIView().zStack(margin: insets, priorities: priorities) { self }
        }
    }
    
    @discardableResult
    func padding(_ value: CGFloat = 8.0, touchTransparency: Bool = true, priorities: UIEdgePriorities = .init(all: .required)) -> UIView {
        self.padding(insets: .init(all: value), touchTransparency: touchTransparency, priorities: priorities)
    }
    
    @discardableResult
    func offset(x: CGFloat = 0, y: CGFloat = 0, touchTransparency: Bool = true, priorities: UIEdgePriorities = .init(all: .required)) -> UIView {
        self.offset(.init(x: x, y: y), touchTransparency: touchTransparency, priorities: priorities)
    }
    
    @discardableResult
    func offset(_ offset: CGPoint, touchTransparency: Bool = true, priorities: UIEdgePriorities = .init(all: .required)) -> UIView {
        self.padding(
            insets: .init(top: offset.y, left: offset.x, bottom: -offset.y, right: -offset.x),
            touchTransparency: touchTransparency,
            priorities: priorities
        )
    }
    
    @discardableResult
    func customSpacing(_ customSpacing: CGFloat) -> UIView {
        HelperCustomSpacingView(customSpacing: customSpacing).zStack{ self }
    }
    
    @discardableResult
    func center() -> UIView {
        HelperTouchTransparencyStackView(axis: .horizontal) {
            HelperTouchTransparencyStackView(axis: .vertical) {
                self
            }.alignment(.center)
        }
        .alignment(.center)
    }
    
    @discardableResult
    func centerX() -> UIView {
        HelperTouchTransparencyStackView(axis: .vertical) {
            self
        }.alignment(.center)
    }
    
    @discardableResult
    func centerY() -> UIView {
        HelperTouchTransparencyStackView(axis: .horizontal) {
            self
        }.alignment(.center)
    }
    
    @discardableResult
    func top() -> UIView {
        HelperTouchTransparencyStackView(axis: .vertical) {
            self
            UIView.spacer()
        }
    }
    
    @discardableResult
    func bottom() -> UIView {
        HelperTouchTransparencyStackView(axis: .vertical) {
            UIView.spacer()
            self
        }
    }
    
    @discardableResult
    func left() -> UIView {
        HelperTouchTransparencyStackView(axis: .horizontal) {
            self
            UIView.spacer()
        }
    }
    
    @discardableResult
    func right() -> UIView {
        HelperTouchTransparencyStackView(axis: .horizontal) {
            UIView.spacer()
            self
        }
    }
}

//MARK: - Declarative constraint method
public extension UIView {
    @discardableResult
    func width(_ width: CGFloat, priority: UILayoutPriority = .required, apply: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        self.widthConstraint(width, priority: priority, apply: apply)
        return self
    }
    
    @discardableResult
    func minWidth(_ width: CGFloat, priority: UILayoutPriority = .required, apply: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        self.minWidthConstraint(width, priority: priority, apply: apply)
        return self
    }
    
    @discardableResult
    func maxWidth(_ width: CGFloat, priority: UILayoutPriority = .required, apply: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        self.maxWidthConstraint(width, priority: priority, apply: apply)
        return self
    }
    
    @discardableResult
    func height(_ height: CGFloat, priority: UILayoutPriority = .required, apply: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        self.heightConstraint(height, priority: priority, apply: apply)
        return self
    }
    
    @discardableResult
    func minHeight(_ height: CGFloat, priority: UILayoutPriority = .required, apply: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        self.minHeightConstraint(height, priority: priority, apply: apply)
        return self
    }
    
    @discardableResult
    func maxHeight(_ height: CGFloat, priority: UILayoutPriority = .required, apply: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        self.maxHeightConstraint(height, priority: priority, apply: apply)
        return self
    }
    
    @discardableResult
    func size(width: CGFloat, height: CGFloat,
              widthPriority: UILayoutPriority = .required, heightPriority: UILayoutPriority = .required,
              apply: ((NSLayoutConstraint, NSLayoutConstraint) -> Void)? = nil) -> Self {
        var widthConstraint: NSLayoutConstraint!
        self.widthConstraint(width, priority: widthPriority) {
            widthConstraint = $0
        }
        var heightConstraint: NSLayoutConstraint!
        self.heightConstraint(height, priority: heightPriority) {
            heightConstraint = $0
        }
        apply?(widthConstraint, heightConstraint)
        return self
    }
    
    @discardableResult
    func minSize(width: CGFloat, height: CGFloat,
                 widthPriority: UILayoutPriority = .required,
                 heightPriority: UILayoutPriority = .required,
                 apply: ((NSLayoutConstraint, NSLayoutConstraint) -> Void)? = nil) -> Self {
        var widthConstraint: NSLayoutConstraint!
        self.minWidthConstraint(width, priority: widthPriority) {
            widthConstraint = $0
        }
        var heightConstraint: NSLayoutConstraint!
        self.minHeightConstraint(height, priority: heightPriority) {
            heightConstraint = $0
        }
        apply?(widthConstraint, heightConstraint)
        return self
    }
    
    @discardableResult
    func maxSize(width: CGFloat, height: CGFloat,
                 widthPriority: UILayoutPriority = .required,
                 heightPriority: UILayoutPriority = .required,
                 apply: ((NSLayoutConstraint, NSLayoutConstraint) -> Void)? = nil) -> Self {
        var widthConstraint: NSLayoutConstraint!
        self.maxWidthConstraint(width, priority: widthPriority) {
            widthConstraint = $0
        }
        var heightConstraint: NSLayoutConstraint!
        self.maxHeightConstraint(height, priority: heightPriority) {
            heightConstraint = $0
        }
        apply?(widthConstraint, heightConstraint)
        return self
    }
    
    @discardableResult
    func widthEqual(to superview: UIView, constraint: HelperConstraint, priority: UILayoutPriority = .required, apply: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        if superview is UIStackView, !superview.subviews.contains(self) {
            superview.addSubview(self)
        }
        let layoutConstraint = self.widthAnchor.constraint(equalTo: constraint.dimension, multiplier: constraint.multiplier, constant: constraint.constant)
        layoutConstraint.isActive = true
        layoutConstraint.priority = priority
        apply?(layoutConstraint)
        return self
    }
    
    @discardableResult
    func widthEqual(to superview: UIView, constraint: NSLayoutDimension, priority: UILayoutPriority = .required, apply: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        widthEqual(to: superview, constraint: .init(dimension: constraint), priority: priority, apply: apply)
    }
    
    @discardableResult
    func heightEqual(to superview: UIView, constraint: HelperConstraint, priority: UILayoutPriority = .required, apply: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        if superview is UIStackView, !superview.subviews.contains(self) {
            superview.addSubview(self)
        }
        let layoutConstraint = self.heightAnchor.constraint(equalTo: constraint.dimension, multiplier: constraint.multiplier, constant: constraint.constant)
        layoutConstraint.priority = priority
        layoutConstraint.isActive = true
        apply?(layoutConstraint)
        return self
    }
    
    @discardableResult
    func heightEqual(to superview: UIView, constraint: NSLayoutDimension, priority: UILayoutPriority = .required, apply: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        heightEqual(to: superview, constraint: .init(dimension: constraint), priority: priority, apply: apply)
    }
    
    @discardableResult
    func aspectRatio(_ ratio: CGFloat, priority: UILayoutPriority = .required, apply: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        self.aspectRatioConstraint(ratio, priority: priority, apply: apply)
        return self
    }
    
    @discardableResult
    func keyPath<T>(_ keyPath: ReferenceWritableKeyPath<UIView, T>, _ value: T) -> Self {
        self[keyPath: keyPath] = value
        return self
    }
}

//MARK: - others
public extension UIView {
    
    func getView(tag: Int, _ recursiveCount: Int = 0) -> UIView? {
        if recursiveCount != 0, self.tag == tag { return self }
        if let view = self.subviews.compactMap({ $0.getView(tag: tag, recursiveCount + 1) }).first {
            return view
        } else if
            let stackView = self as? UIStackView,
            let view = stackView.arrangedSubviews.compactMap({ $0.getView(tag: tag, recursiveCount + 1) }).first {
            return view
        }
        return nil
    }
}

//MARK: - double components constraint
@available(iOS 15.0, *)
public extension UIView {
    
    @discardableResult
    func leadingConstraint(view: UIView, constant: CGFloat = .zero, layoutGuide: LayoutGuideType) -> Self {
        let anchor = switch layoutGuide {
        case .safeArea:
            self.safeAreaLayoutGuide.leadingAnchor
        case .margins:
            self.layoutMarginsGuide.leadingAnchor
        case .readableContent:
            self.readableContentGuide.leadingAnchor
        case .keyboard:
            self.keyboardLayoutGuide.leadingAnchor
        case .normal:
            self.leadingAnchor
        }
        
        let const = view.leadingAnchor.constraint(equalTo: anchor)
        const.constant = constant
        const.isActive = true
        
        return self
    }

    @discardableResult
    func trailingConstraint(view: UIView, constant: CGFloat = .zero, layoutGuide: LayoutGuideType) -> Self {
        let anchor = switch layoutGuide {
        case .safeArea:
            self.safeAreaLayoutGuide.trailingAnchor
        case .margins:
            self.layoutMarginsGuide.trailingAnchor
        case .readableContent:
            self.readableContentGuide.trailingAnchor
        case .keyboard:
            self.keyboardLayoutGuide.trailingAnchor
        case .normal:
            self.trailingAnchor
        }
        
        let const = anchor.constraint(equalTo: view.trailingAnchor)
        const.constant = constant
        const.isActive = true

        return self
    }

    @discardableResult
    func topConstraint(view: UIView, constant: CGFloat = .zero, layoutGuide: LayoutGuideType) -> Self {
        let anchor = switch layoutGuide {
        case .safeArea:
            self.safeAreaLayoutGuide.topAnchor
        case .margins:
            self.layoutMarginsGuide.topAnchor
        case .readableContent:
            self.readableContentGuide.topAnchor
        case .keyboard:
            self.keyboardLayoutGuide.topAnchor
        case .normal:
            self.topAnchor
        }

        let const = view.topAnchor.constraint(equalTo: anchor)
        const.constant = constant
        const.isActive = true
        
        return self
    }
    
    @discardableResult
    func bottomConstraint(view: UIView, constant: CGFloat = .zero, layoutGuide: LayoutGuideType) -> Self {
        let anchor = switch layoutGuide {
        case .safeArea:
            self.safeAreaLayoutGuide.bottomAnchor
        case .margins:
            self.layoutMarginsGuide.bottomAnchor
        case .readableContent:
            self.readableContentGuide.bottomAnchor
        case .keyboard:
            self.keyboardLayoutGuide.bottomAnchor
        case .normal:
            self.bottomAnchor
        }

        let const = anchor.constraint(equalTo: view.bottomAnchor)
        const.constant = constant
        const.isActive = true
        
        return self
    }
    
    @discardableResult
    func centerXConstraint(view: UIView, constant: CGFloat = .zero, layoutGuide: LayoutGuideType) -> Self {
        let anchor = switch layoutGuide {
        case .safeArea:
            self.safeAreaLayoutGuide.centerXAnchor
        case .margins:
            self.layoutMarginsGuide.centerXAnchor
        case .readableContent:
            self.readableContentGuide.centerXAnchor
        case .keyboard:
            self.keyboardLayoutGuide.centerXAnchor
        case .normal:
            self.centerXAnchor
        }

        let const = view.centerXAnchor.constraint(equalTo: anchor)
        const.constant = constant
        const.isActive = true
        
        return self
    }
    
    @discardableResult
    func centerYConstraint(view: UIView, constant: CGFloat = .zero, layoutGuide: LayoutGuideType) -> Self {
        let anchor = switch layoutGuide {
        case .safeArea:
            self.safeAreaLayoutGuide.centerYAnchor
        case .margins:
            self.layoutMarginsGuide.centerYAnchor
        case .readableContent:
            self.readableContentGuide.centerYAnchor
        case .keyboard:
            self.keyboardLayoutGuide.centerYAnchor
        case .normal:
            self.centerYAnchor
        }

        let const = view.centerYAnchor.constraint(equalTo: anchor)
        const.constant = constant
        const.isActive = true
        
        return self
    }

    @discardableResult
    func floatingActionView(
        layoutGuides: UIEdgeLayoutGuides = .init(all: .safeArea),
        position: FloatingActionViewPosition = .trailingBottom(CGPoint(x: 16, y: 16)),
        @SingleUIViewBuilder _ builderAsync: @escaping () async -> UIView
    ) async -> Self {
        let view = await builderAsync()
        self.floatingActionView(layoutGuides: layoutGuides, position: position) {
            view
        }
        return self
    }

    @discardableResult
    func floatingActionView(
        layoutGuides: UIEdgeLayoutGuides = .init(all: .safeArea),
        position: FloatingActionViewPosition = .trailingBottom(CGPoint(x: 16, y: 16)),
        @SingleUIViewBuilder _ builder: @escaping () -> UIView
    ) -> Self {
        
        let view = builder()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
                
        switch position {
        case .leadingTop(let point):
            leadingConstraint(view: view, constant: point.x, layoutGuide: layoutGuides.leading)
            topConstraint(view: view, constant: point.y, layoutGuide: layoutGuides.top)
        case .centerTop(let point):
            centerXConstraint(view: view, constant: point.x, layoutGuide: layoutGuides.centerX)
            topConstraint(view: view, constant: point.y, layoutGuide: layoutGuides.top)
        case .trailingTop(let point):
            trailingConstraint(view: view, constant: point.x, layoutGuide: layoutGuides.centerX)
            topConstraint(view: view, constant: point.y, layoutGuide: layoutGuides.top)
        case .leadingCenter(let point):
            leadingConstraint(view: view, constant: point.x, layoutGuide: layoutGuides.leading)
            topConstraint(view: view, constant: point.y, layoutGuide: layoutGuides.top)
        case .centerCenter(let point):
            centerXConstraint(view: view, constant: point.x, layoutGuide: layoutGuides.centerX)
            centerYConstraint(view: view, constant: point.y, layoutGuide: layoutGuides.centerY)
        case .trailingCenter(let point):
            trailingConstraint(view: view, constant: point.x, layoutGuide: layoutGuides.centerX)
            centerYConstraint(view: view, constant: point.y, layoutGuide: layoutGuides.centerY)
        case .leadingBttom(let point):
            leadingConstraint(view: view, constant: point.x, layoutGuide: layoutGuides.leading)
            bottomConstraint(view: view, constant: point.y, layoutGuide: layoutGuides.bottom)
        case .centerBottom(let point):
            centerXConstraint(view: view, constant: point.x, layoutGuide: layoutGuides.centerX)
            bottomConstraint(view: view, constant: point.y, layoutGuide: layoutGuides.bottom)
        case .trailingBottom(let point):
            trailingConstraint(view: view, constant: point.x, layoutGuide: layoutGuides.centerX)
            bottomConstraint(view: view, constant: point.y, layoutGuide: layoutGuides.bottom)
        }
        
        return self
    }

    @discardableResult
    func edgesConstraints(
        _ view: UIView,
        margin: UIEdgeInsets = .zero,
        layoutGuides: UIEdgeLayoutGuides,
        priorities: UIEdgePriorities
    ) -> Self {

        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        
        let top = switch layoutGuides.top {
        case .safeArea, .keyboard:
            view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
        case .margins:
            view.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor)
        case .readableContent:
            view.topAnchor.constraint(equalTo: self.readableContentGuide.topAnchor)
        case .normal:
            view.topAnchor.constraint(equalTo: self.topAnchor)
        }

        let leading = switch layoutGuides.leading {
        case .safeArea:
            view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor)
        case .margins:
            view.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor)
        case .readableContent:
            view.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor)
        case .keyboard:
            view.leadingAnchor.constraint(equalTo: self.keyboardLayoutGuide.leadingAnchor)
        case .normal:
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        }
        
        let bottom = switch layoutGuides.bottom {
        case .safeArea:
            view.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        case .margins:
            view.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor)
        case .readableContent:
            view.bottomAnchor.constraint(equalTo: self.readableContentGuide.bottomAnchor)
        case .keyboard:
            view.bottomAnchor.constraint(equalTo: self.keyboardLayoutGuide.topAnchor)
        case .normal:
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        }

        let trailing = switch layoutGuides.trailing {
        case .safeArea:
            view.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        case .margins:
            view.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor)
        case .readableContent:
            view.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor)
        case .keyboard:
            view.trailingAnchor.constraint(equalTo: self.keyboardLayoutGuide.trailingAnchor)
        case .normal:
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        }

        top.constant = margin.top
        leading.constant = margin.left
        bottom.constant = margin.bottom
        trailing.constant = margin.right
        
        top.priority = priorities.top
        leading.priority = priorities.leading
        bottom.priority = priorities.bottom
        trailing.priority = priorities.trailing
        
        NSLayoutConstraint.activate([
            top, leading, trailing, bottom
        ])
        
        return self
    }
}

//MARK: - double components constraint

public extension UIView {

    @discardableResult
    func edgesConstraints(
        _ view: UIView,
        margin: UIEdgeInsets = .zero,
        safeAreas: UIEdgeBools,
        priorities: UIEdgePriorities
    ) -> Self {

        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        
        let top = safeAreas.top ?
        view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor) :
        view.topAnchor.constraint(equalTo: self.topAnchor)
        
        let leading = safeAreas.leading ?
        view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor) :
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        
        let bottom = safeAreas.bottom ?
        self.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor) :
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        let trailing = safeAreas.trailing ?
        self.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor) :
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        top.constant = margin.top
        leading.constant = margin.left
        bottom.constant = margin.bottom
        trailing.constant = margin.right
        
        top.priority = priorities.top
        leading.priority = priorities.leading
        bottom.priority = priorities.bottom
        trailing.priority = priorities.trailing
        
        NSLayoutConstraint.activate([
            top, leading, trailing, bottom
        ])
        
        return self
    }
}

//MARK: - single component constraint
public extension UIView {
    
    var minHeightConstraint: CGFloat? {
        get {
            nil //TODO:
        }
        set {
            guard let constraint = newValue else { return }
            heightAnchor.constraint(greaterThanOrEqualToConstant: constraint).isActive = true
        }
    }
    
    func minHeightConstraint(_ value: CGFloat, priority: UILayoutPriority = .required, apply: ((NSLayoutConstraint) -> Void)? = nil) {
        let constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: value)
        constraint.priority = priority
        constraint.isActive = true
        apply?(constraint)
    }
    
    var minWidthConstraint: CGFloat? {
        get {
            nil //TODO:
        }
        set {
            guard let constraint = newValue else { return }
            widthAnchor.constraint(greaterThanOrEqualToConstant: constraint).isActive = true
        }
    }
    
    func minWidthConstraint(_ value: CGFloat, priority: UILayoutPriority = .required, apply: ((NSLayoutConstraint) -> Void)? = nil) {
        let constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: value)
        constraint.priority = priority
        constraint.isActive = true
        apply?(constraint)
    }
    
    var maxHeightConstraint: CGFloat? {
        get {
            nil //TODO:
        }
        set {
            guard let constraint = newValue else { return }
            heightAnchor.constraint(lessThanOrEqualToConstant: constraint).isActive = true
        }
    }
    
    func maxHeightConstraint(_ value: CGFloat, priority: UILayoutPriority = .required, apply: ((NSLayoutConstraint) -> Void)? = nil) {
        let constraint = heightAnchor.constraint(lessThanOrEqualToConstant: value)
        constraint.priority = priority
        constraint.isActive = true
        apply?(constraint)
    }
    
    var maxWidthConstraint: CGFloat? {
        get {
            nil //TODO:
        }
        set {
            guard let constraint = newValue else { return }
            widthAnchor.constraint(lessThanOrEqualToConstant: constraint).isActive = true
        }
    }
    
    func maxWidthConstraint(_ value: CGFloat, priority: UILayoutPriority = .required, apply: ((NSLayoutConstraint) -> Void)? = nil) {
        let constraint = widthAnchor.constraint(lessThanOrEqualToConstant: value)
        constraint.priority = priority
        constraint.isActive = true
        apply?(constraint)
    }
    
    var heightConstraint: CGFloat? {
        get {
            nil //TODO:
        }
        set {
            guard let constraint = newValue else { return }
            heightAnchor.constraint(equalToConstant: constraint).isActive = true
        }
    }
    
    func heightConstraint(_ value: CGFloat, priority: UILayoutPriority = .required, apply: ((NSLayoutConstraint) -> Void)? = nil) {
        let constraint = heightAnchor.constraint(equalToConstant: value)
        constraint.priority = priority
        constraint.isActive = true
        apply?(constraint)
    }
    
    var widthConstraint: CGFloat? {
        get {
            nil //TODO:
        }
        set {
            guard let constraint = newValue else { return }
            widthAnchor.constraint(equalToConstant: constraint).isActive = true
        }
    }
    
    func widthConstraint(_ value: CGFloat, priority: UILayoutPriority = .required, apply: ((NSLayoutConstraint) -> Void)? = nil) {
        let constraint = widthAnchor.constraint(equalToConstant: value)
        constraint.priority = priority
        constraint.isActive = true
        apply?(constraint)
    }
    
    var aspectRatioConstraint: CGFloat? {
        get {
            nil
        }
        set {
            guard let constraint = newValue else { return }
            heightAnchor.constraint(equalTo: widthAnchor, multiplier: constraint).isActive = true
        }
    }
    
    func aspectRatioConstraint(_ value: CGFloat, priority: UILayoutPriority = .required, apply: ((NSLayoutConstraint) -> Void)? = nil) {
        let constraint = heightAnchor.constraint(equalTo: widthAnchor, multiplier: value)
        constraint.priority = priority
        constraint.isActive = true
        apply?(constraint)
    }
}

//MARK: -
public extension UIView {
    @discardableResult
    func frame(_ frame: CGRect) -> Self {
        self.frame = frame
        return self
    }

    @discardableResult
    func bounds(_ bounds: CGRect) -> Self {
        self.bounds = bounds
        return self
    }

    @discardableResult
    func center(_ center: CGPoint) -> Self {
        self.center = center
        return self
    }
    
    @discardableResult
    func transform(_ transform: CGAffineTransform) -> Self {
        self.transform = transform
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func transform3D(_ transform3D: CATransform3D) -> Self {
        self.transform3D = transform3D
        return self
    }

    @discardableResult
    func contentScaleFactor(_ contentScaleFactor: CGFloat) -> Self {
        self.contentScaleFactor = contentScaleFactor
        return self
    }

    @available(iOS 16.0, *)
    @discardableResult
    func anchorPoint(_ anchorPoint: CGPoint) -> Self {
        self.anchorPoint = anchorPoint
        return self
    }

    @discardableResult
    func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool) -> Self {
        self.isMultipleTouchEnabled = isMultipleTouchEnabled
        return self
    }

    @discardableResult
    func isExclusiveTouch(_ isExclusiveTouch: Bool) -> Self {
        self.isExclusiveTouch = isExclusiveTouch
        return self
    }

    @discardableResult
    func autoresizesSubviews(_ autoresizesSubviews: Bool) -> Self {
        self.autoresizesSubviews = autoresizesSubviews
        return self
    }

    @discardableResult
    func autoresizingMask(_ autoresizingMask: UIView.AutoresizingMask) -> Self {
        self.autoresizingMask = autoresizingMask
        return self
    }
}
