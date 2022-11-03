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
        UIView.imperative {
            $0.isUserInteractionEnabled = false
        }
    }
    
    @discardableResult
    static func divider() -> UIView {
        UIView.spacer().height(0.5).backgroundColor(.lightGray)
    }
    
    @discardableResult
    static func path(_ imperativeBezierPath: @escaping () -> Void) -> HelperPathView {
        HelperPathView(imperativeBezierPath)
    }
}


//MARK: - Declarative method
public extension UIView {
    
    func declarative(priorities: UIEdgePriorities, reset: Bool, _ builder: () -> UIView) {
        let view = builder()
        if reset {
            self.subviews.forEach { $0.removeFromSuperview() }
        }
        self.edgesConstraints(view, safeAreas: .init(all: false), priorities: priorities)
    }
    
    func declarative(reset: Bool, _ builder: () -> UIView) {
        declarative(priorities: .init(), reset: reset, builder)
    }
    
    func declarative(priorities: UIEdgePriorities, _ builder: () -> UIView) {
        declarative(priorities: priorities, reset: true, builder)
    }
    
    func declarative(_ builder: () -> UIView) {
        self.declarative(priorities: .init(), reset: true, builder)
    }
    
    @discardableResult
    func imperative(_ imperative: ((Self) -> Void)) -> Self {
        imperative(self)
        return self
    }
    
    @discardableResult
    func cornerRadius(_ radius: CGFloat, maskedCorners: CACornerMask) -> Self {
        imperative {
            $0.layer.cornerRadius = radius
            $0.layer.maskedCorners = maskedCorners
        }
    }
    
    @discardableResult
    func cornerRadius(_ radius: CGFloat) -> Self {
        cornerRadius(radius, maskedCorners: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner])
    }
    
    @discardableResult
    func border(color: UIColor, width: CGFloat) -> Self {
        imperative {
            $0.layer.borderColor = color.cgColor
            $0.layer.borderWidth = width
        }
    }
    
    @discardableResult
    func tag(_ tag: Int) -> Self {
        imperative {
            $0.tag = tag
        }
    }
    
    @discardableResult
    func backgroundColor(_ backgroundColor: UIColor) -> Self {
        imperative {
            $0.backgroundColor = backgroundColor
        }
    }
    
    @discardableResult
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        imperative {
            $0.isUserInteractionEnabled = isUserInteractionEnabled
        }
    }
    
    func clipsToBounds(_ clipsToBounds: Bool) -> Self {
        imperative {
            $0.clipsToBounds = clipsToBounds
        }
    }
    
    @discardableResult
    func contentMode(_ contentMode: ContentMode) -> Self {
        imperative {
            $0.contentMode = contentMode
        }
    }
    
    @discardableResult
    func alpha(_ alpha: CGFloat) -> Self {
        imperative {
            $0.alpha = alpha
        }
    }
    
    @discardableResult
    func isHidden(_ isHidden: Bool) -> Self {
        imperative {
            $0.isHidden = isHidden
        }
    }
    
    @discardableResult
    func isShow(_ isShow: Bool) -> Self {
        isHidden(!isShow)
    }
    
    @discardableResult
    func transform(_ transform: CGAffineTransform) -> Self {
        imperative {
            $0.transform = transform
        }
    }
    
    @discardableResult
    func shadow(color: UIColor = .black, radius: CGFloat = 0.0, x: CGFloat = 0.0, y: CGFloat = 0.0) -> Self {
        imperative {
            $0.layer.shadowColor = color.cgColor
            $0.layer.shadowOpacity = 1.0
            $0.layer.shadowOffset = CGSize(width: x, height: y)
            $0.layer.shadowRadius = radius
        }
    }
    
    @discardableResult
    func add(gestureRecognizer: UIGestureRecognizer) -> Self {
        imperative {
            $0.addGestureRecognizer(gestureRecognizer)
        }
    }
    
    @discardableResult
    func addGestureRecognizer(_ gestureBuilder: () -> UIGestureRecognizer) -> Self {
        imperative {
            $0.addGestureRecognizer(gestureBuilder())
        }
    }
    
    @discardableResult
    func addSubview(margin: UIEdgeInsets = .zero, priorities: UIEdgePriorities = .init(all: .required),
                    @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> Self {
        self.zStack(margin: margin, priorities: priorities, builder)
    }
    
    @discardableResult
    func zStack(margin: UIEdgeInsets = .zero, priorities: UIEdgePriorities = .init(all: .required),
                @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> Self {
        imperative { superView in
            builder().compactMap({$0}).forEach { (view) in
                self.edgesConstraints(view, margin: margin, safeAreas: .init(all: false), priorities: priorities)
            }
        }
    }
    
    @discardableResult
    func contentHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self {
        imperative {
            $0.setContentHuggingPriority(priority, for: axis)
        }
    }
    
    @discardableResult
    func contentCompressionResistancePriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self {
        imperative {
            $0.setContentCompressionResistancePriority(priority, for: axis)
        }
    }
    
    @discardableResult
    func contentPriorities(_ priorities: UIContentPriorities) -> Self {
        imperative {
            if let priority = priorities.huggingVertical {
                $0.setContentHuggingPriority(priority, for: .vertical)
            }
            if let priority = priorities.huggingHorizontal {
                $0.setContentHuggingPriority(priority, for: .horizontal)
            }
            if let priority = priorities.compressionResistanceVertical {
                $0.setContentCompressionResistancePriority(priority, for: .vertical)
            }
            if let priority = priorities.compressionResistanceHorizontal {
                $0.setContentCompressionResistancePriority(priority, for: .horizontal)
            }
        }
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
    ) -> UIView {
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
}

//MARK: - other instanse
public extension UIView {
    
    @discardableResult
    static func imperative(_ imperative: ((Self) -> Void)) -> Self {
        Self().imperative(imperative)
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
    func width(_ width: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        self.widthConstraint(width, imperative: imperative)
        return self
    }
    
    @discardableResult
    func minWidth(_ width: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        self.minWidthConstraint(width, imperative: imperative)
        return self
    }
    
    @discardableResult
    func maxWidth(_ width: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        self.maxWidthConstraint(width, imperative: imperative)
        return self
    }
    
    @discardableResult
    func height(_ height: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        self.heightConstraint(height, imperative: imperative)
        return self
    }
    
    @discardableResult
    func minHeight(_ height: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        self.minHeightConstraint(height, imperative: imperative)
        return self
    }
    
    @discardableResult
    func maxHeight(_ height: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        self.maxHeightConstraint(height, imperative: imperative)
        return self
    }
    
    @discardableResult
    func size(width: CGFloat, height: CGFloat,
              widthPriority: UILayoutPriority = .required, heightPriority: UILayoutPriority = .required,
              imperative: ((NSLayoutConstraint, NSLayoutConstraint) -> Void)? = nil) -> Self {
        var widthConstraint: NSLayoutConstraint!
        self.widthConstraint(width, priority: widthPriority) {
            widthConstraint = $0
        }
        var heightConstraint: NSLayoutConstraint!
        self.heightConstraint(height, priority: heightPriority) {
            heightConstraint = $0
        }
        imperative?(widthConstraint, heightConstraint)
        return self
    }
    
    @discardableResult
    func minSize(width: CGFloat, height: CGFloat,
                 widthPriority: UILayoutPriority = .required,
                 heightPriority: UILayoutPriority = .required,
                 imperative: ((NSLayoutConstraint, NSLayoutConstraint) -> Void)? = nil) -> Self {
        var widthConstraint: NSLayoutConstraint!
        self.minWidthConstraint(width, priority: widthPriority) {
            widthConstraint = $0
        }
        var heightConstraint: NSLayoutConstraint!
        self.minHeightConstraint(height, priority: heightPriority) {
            heightConstraint = $0
        }
        imperative?(widthConstraint, heightConstraint)
        return self
    }
    
    @discardableResult
    func maxSize(width: CGFloat, height: CGFloat,
                 widthPriority: UILayoutPriority = .required,
                 heightPriority: UILayoutPriority = .required,
                 imperative: ((NSLayoutConstraint, NSLayoutConstraint) -> Void)? = nil) -> Self {
        var widthConstraint: NSLayoutConstraint!
        self.maxWidthConstraint(width, priority: widthPriority) {
            widthConstraint = $0
        }
        var heightConstraint: NSLayoutConstraint!
        self.maxHeightConstraint(height, priority: heightPriority) {
            heightConstraint = $0
        }
        imperative?(widthConstraint, heightConstraint)
        return self
    }
    
    @discardableResult
    func widthEqual(to superview: UIView, constraint: HelperConstraint, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        if superview is UIStackView, !superview.subviews.contains(self) {
            superview.addSubview(self)
        }
        let layoutConstraint = self.widthAnchor.constraint(equalTo: constraint.dimension, multiplier: constraint.multiplier, constant: constraint.constant)
        layoutConstraint.isActive = true
        layoutConstraint.priority = priority
        imperative?(layoutConstraint)
        return self
    }
    
    @discardableResult
    func widthEqual(to superview: UIView, constraint: NSLayoutDimension, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        widthEqual(to: superview, constraint: .init(dimension: constraint), priority: priority, imperative: imperative)
    }
    
    @discardableResult
    func heightEqual(to superview: UIView, constraint: HelperConstraint, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        if superview is UIStackView, !superview.subviews.contains(self) {
            superview.addSubview(self)
        }
        let layoutConstraint = self.heightAnchor.constraint(equalTo: constraint.dimension, multiplier: constraint.multiplier, constant: constraint.constant)
        layoutConstraint.priority = priority
        layoutConstraint.isActive = true
        imperative?(layoutConstraint)
        return self
    }
    
    @discardableResult
    func heightEqual(to superview: UIView, constraint: NSLayoutDimension, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        heightEqual(to: superview, constraint: .init(dimension: constraint), priority: priority, imperative: imperative)
    }
    
    @discardableResult
    func aspectRatio(_ ratio: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        self.aspectRatioConstraint(ratio, priority: priority, imperative: imperative)
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
public extension UIView {
    func edgesConstraints(
        _ view: UIView,
        margin: UIEdgeInsets = .zero,
        safeAreas: UIEdgeBools,
        priorities: UIEdgePriorities
    ) {
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
    
    func minHeightConstraint(_ value: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) {
        let constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: value)
        constraint.priority = priority
        constraint.isActive = true
        imperative?(constraint)
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
    
    func minWidthConstraint(_ value: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) {
        let constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: value)
        constraint.priority = priority
        constraint.isActive = true
        imperative?(constraint)
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
    
    func maxHeightConstraint(_ value: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) {
        let constraint = heightAnchor.constraint(lessThanOrEqualToConstant: value)
        constraint.priority = priority
        constraint.isActive = true
        imperative?(constraint)
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
    
    func maxWidthConstraint(_ value: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) {
        let constraint = widthAnchor.constraint(lessThanOrEqualToConstant: value)
        constraint.priority = priority
        constraint.isActive = true
        imperative?(constraint)
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
    
    func heightConstraint(_ value: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) {
        let constraint = heightAnchor.constraint(equalToConstant: value)
        constraint.priority = priority
        constraint.isActive = true
        imperative?(constraint)
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
    
    func widthConstraint(_ value: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) {
        let constraint = widthAnchor.constraint(equalToConstant: value)
        constraint.priority = priority
        constraint.isActive = true
        imperative?(constraint)
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
    
    func aspectRatioConstraint(_ value: CGFloat, priority: UILayoutPriority = .required, imperative: ((NSLayoutConstraint) -> Void)? = nil) {
        let constraint = heightAnchor.constraint(equalTo: widthAnchor, multiplier: value)
        constraint.priority = priority
        constraint.isActive = true
        imperative?(constraint)
    }
}
