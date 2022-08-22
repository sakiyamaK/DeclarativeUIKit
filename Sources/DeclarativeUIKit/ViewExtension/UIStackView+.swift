import UIKit.UIStackView
import UIKit

public extension UIStackView {
    
    convenience init(axis: NSLayoutConstraint.Axis = .vertical, alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: () -> [UIView?]) {
        self.init(frame: .zero)
        self.backgroundColor = .clear
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        builder().compactMap { $0 }.forEach {
            if let customSpacingView = $0 as? HelperCustomSpacingView, let view = customSpacingView.subviews.first {
                view.translatesAutoresizingMaskIntoConstraints = false
                self.addArrangedSubview(view)
                self.setCustomSpacing(customSpacingView.customSpacing, after: view)
            } else {
                $0.translatesAutoresizingMaskIntoConstraints = false
                self.addArrangedSubview($0)
            }
        }
    }

    static func vertical(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> UIStackView {
        if isTouchTransparency {
            return HelperTouchTransparencyStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        }
        return UIStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
    }
    
    static func vStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> UIStackView {
        UIStackView.vertical(alignment: alignment, distribution: distribution, spacing: spacing, isTouchTransparency: isTouchTransparency, builder)
    }
    
    static func horizontal(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> UIStackView {
        if isTouchTransparency {
            return HelperTouchTransparencyStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        }
        return UIStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
    }
    static func hStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> UIStackView {
        UIStackView.horizontal(alignment: alignment, distribution: distribution, spacing: spacing, isTouchTransparency: isTouchTransparency, builder)
    }
}

//MARK: - with superview
public extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis = .vertical, alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: (UIView) -> [UIView?]) {
        self.init(frame: .zero)
        self.backgroundColor = .clear
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        builder(self).compactMap { $0 }.forEach {
            if let customSpacingView = $0 as? HelperCustomSpacingView, let view = customSpacingView.subviews.first {
                view.translatesAutoresizingMaskIntoConstraints = false
                self.addArrangedSubview(view)
                self.setCustomSpacing(customSpacingView.customSpacing, after: view)
            } else {
                $0.translatesAutoresizingMaskIntoConstraints = false
                self.addArrangedSubview($0)
            }
        }
    }
    
    static func vertical(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: (UIView) -> [UIView?]) -> UIStackView {
        if isTouchTransparency {
            return HelperTouchTransparencyStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        }
        return UIStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
    }
    
    static func vStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: (UIView) -> [UIView?]) -> UIStackView {
        UIStackView.vertical(alignment: alignment, distribution: distribution, spacing: spacing, isTouchTransparency: isTouchTransparency, builder)
    }
    
    static func horizontal(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: (UIView) -> [UIView?]) -> UIStackView {
        if isTouchTransparency {
            return HelperTouchTransparencyStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        }
        return UIStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
    }
    static func hStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: (UIView) -> [UIView?]) -> UIStackView {
        UIStackView.horizontal(alignment: alignment, distribution: distribution, spacing: spacing, isTouchTransparency: isTouchTransparency, builder)
    }
}

public extension UIStackView {
    
    @discardableResult
    func alignment(_ alignment: Alignment) -> Self {
        self.alignment = alignment
        return self
    }
    
    @discardableResult
    func distribution(_ distribution: Distribution) -> Self {
        self.distribution = distribution
        return self
    }
    
    @discardableResult
    func spacing(_ spacing: CGFloat) -> Self {
        self.spacing = spacing
        return self
    }
}
