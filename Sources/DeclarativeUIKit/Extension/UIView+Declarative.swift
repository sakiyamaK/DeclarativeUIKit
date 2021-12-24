import UIKit.UIView

public extension UIView {

    func edgesConstraints(_ view: UIView, isSafeArea: Bool = true) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        let constraints: [NSLayoutConstraint]
        let bottom: NSLayoutConstraint
        if isSafeArea {
            bottom = self.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            constraints = [
                view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                view.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
                self.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: view.rightAnchor),
                bottom
            ]
        } else {
            bottom = self.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            constraints = [
                view.topAnchor.constraint(equalTo: self.topAnchor),
                view.leftAnchor.constraint(equalTo: self.leftAnchor),
                self.rightAnchor.constraint(equalTo: view.rightAnchor),
                bottom
            ]

        }
        bottom.priority = .defaultLow
        NSLayoutConstraint.activate(constraints)
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

    static func build(_ setup: ((Self) -> Void)) -> Self {
        let view = Self()
        view.translatesAutoresizingMaskIntoConstraints = false
        setup(view)
        return view
    }

    var heightConstraint: CGFloat? {
        get {
            nil
        }
        set {
            guard let constraint = newValue else { return }
            heightAnchor.constraint(equalToConstant: constraint).isActive = true
        }
    }

    var widthConstraint: CGFloat? {
        get {
            nil
        }
        set {
            guard let constraint = newValue else { return }
            widthAnchor.constraint(equalToConstant: constraint).isActive = true
        }
    }

    @discardableResult
    func circle(radius: CGFloat) -> Self {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        return self
    }
}
