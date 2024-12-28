import UIKit.UIStackView
import UIKit

public extension UIStackView {
    
    convenience init(axis: NSLayoutConstraint.Axis = .vertical, alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: @escaping () async -> [UIView?]) {
        self.init(frame: .zero)
        self.backgroundColor = .clear
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        Task { @MainActor in
            await builder().compactMap { $0 }.forEach {
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
    }

    static func vertical(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping () async -> [UIView?]) -> UIStackView {
        if isTouchTransparency {
            HelperTouchTransparencyStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        } else {
            UIStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        }
    }
    
    static func vStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping () async -> [UIView?]) -> UIStackView {
        UIStackView.vertical(alignment: alignment, distribution: distribution, spacing: spacing, isTouchTransparency: isTouchTransparency, builder)
    }
    
    static func horizontal(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping () async -> [UIView?]) -> UIStackView {
        if isTouchTransparency {
            HelperTouchTransparencyStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        } else {
            UIStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        }
    }
    static func hStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping () async -> [UIView?]) -> UIStackView {
        UIStackView.horizontal(alignment: alignment, distribution: distribution, spacing: spacing, isTouchTransparency: isTouchTransparency, builder)
    }
}

//MARK: - with superview
public extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis = .vertical, alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: @escaping (UIView) async -> [UIView?]) {
        self.init(frame: .zero)
        self.backgroundColor = .clear
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        Task { @MainActor in
            await builder(self).compactMap { $0 }.forEach {
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
    }
    
    static func vertical(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping (UIView) async -> [UIView?]) -> UIStackView {
        if isTouchTransparency {
            HelperTouchTransparencyStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        } else {
            UIStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        }
    }
    
    static func vStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping (UIView) async -> [UIView?]) -> UIStackView {
        UIStackView.vertical(alignment: alignment, distribution: distribution, spacing: spacing, isTouchTransparency: isTouchTransparency, builder)
    }
    
    static func horizontal(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping (UIView) async -> [UIView?]) -> UIStackView {
        if isTouchTransparency {
            HelperTouchTransparencyStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        } else {
            UIStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        }
    }
    static func hStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping (UIView) async -> [UIView?]) -> UIStackView {
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
    
    @discardableResult
    func isBaselineRelativeArrangement(_ isBaselineRelativeArrangement: Bool) -> Self {
        self.isBaselineRelativeArrangement = isBaselineRelativeArrangement
        return self
    }

    @discardableResult
    func isLayoutMarginsRelativeArrangement(_ isLayoutMarginsRelativeArrangement: Bool) -> Self {
        self.isLayoutMarginsRelativeArrangement = isLayoutMarginsRelativeArrangement
        return self
    }
    
    @discardableResult
    func margins(_ margins: NSDirectionalEdgeInsets) -> Self {
        self.isLayoutMarginsRelativeArrangement(true)
            .directionalLayoutMargins(margins)
    }
}
