import UIKit.UIStackView
import UIKit

public extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis = .vertical, alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: @escaping () -> [UIView?]) {
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
    
    convenience init(axis: NSLayoutConstraint.Axis = .vertical, alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builderAsync: @escaping () async -> [UIView?]) async {
        self.init(frame: .zero)
        self.backgroundColor = .clear
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        await builderAsync().compactMap { $0 }.forEach {
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

    static func vertical(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping () -> [UIView?]) -> UIStackView {
        if isTouchTransparency {
            HelperTouchTransparencyStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        } else {
            UIStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        }
    }

    static func vertical(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builderAsync: @escaping () async -> [UIView?]) async -> UIStackView {
        if isTouchTransparency {
            await HelperTouchTransparencyStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builderAsync)
        } else {
            await UIStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builderAsync)
        }
    }
    
    static func vStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping () -> [UIView?]) -> UIStackView {
        UIStackView.vertical(alignment: alignment, distribution: distribution, spacing: spacing, isTouchTransparency: isTouchTransparency, builder)
    }
    
    static func vStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builderAsync: @escaping () async -> [UIView?]) async -> UIStackView {
        await UIStackView.vertical(alignment: alignment, distribution: distribution, spacing: spacing, isTouchTransparency: isTouchTransparency, builderAsync)
    }

    static func horizontal(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping () -> [UIView?]) -> UIStackView {
        if isTouchTransparency {
            HelperTouchTransparencyStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        } else {
            UIStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        }
    }
    
    static func horizontal(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builderAsync: @escaping () async -> [UIView?]) async -> UIStackView {
        if isTouchTransparency {
            await HelperTouchTransparencyStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builderAsync)
        } else {
            await UIStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builderAsync)
        }
    }
    
    static func hStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping () -> [UIView?]) -> UIStackView {
        UIStackView.horizontal(alignment: alignment, distribution: distribution, spacing: spacing, isTouchTransparency: isTouchTransparency, builder)
    }
    
    static func hStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builderAsync: @escaping () async -> [UIView?]) async -> UIStackView {
        await UIStackView.horizontal(alignment: alignment, distribution: distribution, spacing: spacing, isTouchTransparency: isTouchTransparency, builderAsync)
    }
}

//MARK: - with superview
public extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis = .vertical, alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: @escaping (UIStackView) -> [UIView?]) {
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
    
    convenience init(axis: NSLayoutConstraint.Axis = .vertical, alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builderAsync: @escaping (UIStackView) async -> [UIView?]) async {
        self.init(frame: .zero)
        self.backgroundColor = .clear
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        await builderAsync(self).compactMap { $0 }.forEach {
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

    static func vertical(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping (UIStackView) -> [UIView?]) -> UIStackView {
        if isTouchTransparency {
            HelperTouchTransparencyStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        } else {
            UIStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        }
    }

    static func vertical(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builderAsync: @escaping (UIStackView) async -> [UIView?]) async -> UIStackView {
        if isTouchTransparency {
            await HelperTouchTransparencyStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builderAsync)
        } else {
            await UIStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builderAsync)
        }
    }
    
    static func vStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping (UIStackView) -> [UIView?]) -> UIStackView {
        UIStackView.vertical(alignment: alignment, distribution: distribution, spacing: spacing, isTouchTransparency: isTouchTransparency, builder)
    }
    
    static func vStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builderAsync: @escaping (UIStackView) async -> [UIView?]) async -> UIStackView {
        await UIStackView.vertical(alignment: alignment, distribution: distribution, spacing: spacing, isTouchTransparency: isTouchTransparency, builderAsync)
    }

    static func horizontal(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping (UIStackView) -> [UIView?]) -> UIStackView {
        if isTouchTransparency {
            HelperTouchTransparencyStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        } else {
            UIStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        }
    }
    
    static func horizontal(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builderAsync: @escaping (UIStackView) async -> [UIView?]) async -> UIStackView {
        if isTouchTransparency {
            await HelperTouchTransparencyStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builderAsync)
        } else {
            await UIStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builderAsync)
        }
    }
    
    static func hStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping (UIStackView) -> [UIView?]) -> UIStackView {
        UIStackView.horizontal(alignment: alignment, distribution: distribution, spacing: spacing, isTouchTransparency: isTouchTransparency, builder)
    }
    
    static func hStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builderAsync: @escaping (UIStackView) async -> [UIView?]) async -> UIStackView {
        await UIStackView.horizontal(alignment: alignment, distribution: distribution, spacing: spacing, isTouchTransparency: isTouchTransparency, builderAsync)
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
