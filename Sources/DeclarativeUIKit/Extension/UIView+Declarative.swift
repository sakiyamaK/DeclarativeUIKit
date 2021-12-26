import UIKit.UIView
import UIKit

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

public extension UIView {
    
    static func build(_ setup: ((Self) -> Void)) -> Self {
        let view = Self()
        view.translatesAutoresizingMaskIntoConstraints = false
        setup(view)
        return view
    }
    
    static func spacer(width: CGFloat? = nil, height: CGFloat? = nil, backgroundColor: UIColor? = nil) -> Self {
        .build {
            $0.isUserInteractionEnabled = false
            if let width = width {
                $0.widthConstraint = width
            }
            if let height = height {
                $0.heightConstraint = height
            }
            if let backgroundColor = backgroundColor {
                $0.backgroundColor = backgroundColor
            }
        }
    }
}


public extension UIView {
        
    @discardableResult
    func circle(radius: CGFloat) -> Self {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        return self
    }
    
    @discardableResult
    func tag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }
    
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        self.backgroundColor = backgroundColor
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
}
