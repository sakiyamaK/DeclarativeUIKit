import UIKit.UIView

public struct TopLeadingBottomTrailingSafeArea {
    var top: Bool = true
    var leading: Bool = true
    var bottom: Bool = true
    var trailing: Bool = true
}

public struct TopLeadingBottomTrailingPriority {
    var top: UILayoutPriority = .required
    var leading: UILayoutPriority = .required
    var bottom: UILayoutPriority = .required
    var trailing: UILayoutPriority = .required
}

//MARK: - instance
public extension UIView {
    
    convenience init(_ imperative: ((Self) -> Void)) {
        self.init()
        imperative(self)
    }
    
    func declarate(
        priorities: TopLeadingBottomTrailingPriority,
        @SingleUIViewBuilder _ builder: () -> UIView) {
        let view = builder()
        self.subviews.forEach { $0.removeFromSuperview() }
            self.edgesConstraints(view, safeAreas: .init(), priorities: priorities)
    }
    
    func declarate(@SingleUIViewBuilder _ builder: () -> UIView) {
        self.declarate(priorities: .init(), builder)
    }

    static func spacer() -> UIView {
        UIView {
            $0.isUserInteractionEnabled = false
        }
    }
}

//MARK: - Declarative method
public extension UIView {
    
    @discardableResult
    func imperative(_ imperative: ((Self) -> Void)) -> Self {
        imperative(self)
        return self
    }
            
    @discardableResult
    func cornerRadius(_ radius: CGFloat, maskedCorners: CACornerMask) -> Self {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = maskedCorners
        self.clipsToBounds = true
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
    func width(_ width: CGFloat) -> Self {
        self.widthConstraint = width
        return self
    }
    
    @discardableResult
    func minWidth(_ width: CGFloat) -> Self {
        self.minWidthConstraint = width
        return self
    }

    @discardableResult
    func height(_ height: CGFloat) -> Self {
        self.heightConstraint = height
        return self
    }
    
    @discardableResult
    func minHeight(_ height: CGFloat) -> Self {
        self.minHeightConstraint = height
        return self
    }
    
    @discardableResult
    func size(width: CGFloat, height: CGFloat) -> Self {
        self.widthConstraint = width
        self.heightConstraint = height
        return self
    }
    
    @discardableResult
    func minSize(width: CGFloat, height: CGFloat) -> Self {
        self.minWidthConstraint = width
        self.minHeightConstraint = height
        return self
    }

    @discardableResult
    func aspectRatio(_ ratio: CGFloat) -> Self {
        self.aspectRatioConstraint = ratio
        return self
    }

    @discardableResult
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        self.isUserInteractionEnabled = isUserInteractionEnabled
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
    func transform(_ transform: CGAffineTransform) -> Self {
        self.transform = transform
        return self
    }

    @discardableResult
    func addSubview(
        margin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
        @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> Self {
            self.zStack(margin: margin, builder)
        }

    @discardableResult
    func zStack(
        margin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
        @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> Self {
            let superView = self
            builder().compactMap { $0 }.forEach { (view) in
            superView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: superView.topAnchor, constant: margin.top),
                view.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: margin.left),
                superView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: margin.right),
                superView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: margin.bottom)
            ])
        }

        return self
    }
}

//MARK: - others
public extension UIView {
    
    func getView(tag: Int) -> UIView? {
        if self.tag == tag { return self }
        if let view = self.subviews.compactMap({ $0.getView(tag: tag) }).first {
            return view
        } else if
            let stackView = self as? UIStackView,
            let view = stackView.arrangedSubviews.compactMap({ $0.getView(tag: tag) }).first {
            return view
        }
        return nil
    }
}

//MARK: - Constraint
public extension UIView {
    
    func edgesConstraints(
        _ view: UIView,
        safeAreas: TopLeadingBottomTrailingSafeArea,
        priorities: TopLeadingBottomTrailingPriority
    ) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        
        let top = safeAreas.top ?
        view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor) :
        view.topAnchor.constraint(equalTo: self.topAnchor)
        
        let leading = safeAreas.leading ?
        view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor) :
        view.leadingAnchor.constraint(equalTo: self.leftAnchor)
        
        let bottom = safeAreas.bottom ?
        self.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor) :
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        let trailing = safeAreas.trailing ?
        self.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor) :
        self.rightAnchor.constraint(equalTo: view.rightAnchor)
               
        top.priority = priorities.top
        leading.priority = priorities.leading
        trailing.priority = priorities.trailing
        bottom.priority = priorities.bottom
        
        NSLayoutConstraint.activate([
            top, leading, trailing, bottom
        ])
    }
    
    var minHeightConstraint: CGFloat? {
        get {
            nil //TODO:
        }
        set {
            guard let constraint = newValue else { return }
            heightAnchor.constraint(greaterThanOrEqualToConstant: constraint).isActive = true
        }
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
    
    var maxHeightConstraint: CGFloat? {
        get {
            nil //TODO:
        }
        set {
            guard let constraint = newValue else { return }
            heightAnchor.constraint(lessThanOrEqualToConstant: constraint).isActive = true
        }
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
    
    
    var heightConstraint: CGFloat? {
        get {
            nil //TODO:
        }
        set {
            guard let constraint = newValue else { return }
            heightAnchor.constraint(equalToConstant: constraint).isActive = true
        }
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
    
    var aspectRatioConstraint: CGFloat? {
        get {
            nil
        }
        set {
            guard let constraint = newValue else { return }
            heightAnchor.constraint(equalTo: widthAnchor, multiplier: constraint).isActive = true
        }
    }
}
