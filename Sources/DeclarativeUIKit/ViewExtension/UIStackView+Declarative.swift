import UIKit.UIStackView

public extension UIStackView {
    static func stack(
axis: NSLayoutConstraint.Axis = .vertical,
alignment: Alignment = .fill,
distribution: Distribution = .fill,
spacing: CGFloat = 0.0,
    @ArrayUIViewBuilder _ builder: () -> [UIView?]
    ) -> UIStackView {
        UIStackView {
            guard let stackView = $0 as? UIStackView else { return }
            stackView.backgroundColor = .clear
            stackView.axis = axis
            stackView.alignment = alignment
            stackView.distribution = distribution
            stackView.spacing = spacing
            builder().compactMap { $0 }.forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                stackView.addArrangedSubview($0)
            }
        }
    }
    
    static func vertical(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> UIStackView {
        .stack(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
    }
    
    static func vStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> UIStackView {
        .stack(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
    }
    
    static func horizontal(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> UIStackView {
        .stack(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
    }
    static func hStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> UIStackView {
        .stack(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
    }
}

//MARK: - with superview
public extension UIStackView {
    static func stack(
axis: NSLayoutConstraint.Axis = .vertical,
alignment: Alignment = .fill,
distribution: Distribution = .fill,
spacing: CGFloat = 0.0,
    @ArrayUIViewBuilder _ builder: (UIView) -> [UIView?]
    ) -> UIStackView {
        UIStackView {
            let stackView = $0 as! UIStackView
            stackView.backgroundColor = .clear
            stackView.axis = axis
            stackView.alignment = alignment
            stackView.distribution = distribution
            stackView.spacing = spacing
            builder(stackView).compactMap { $0 }.forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                stackView.addArrangedSubview($0)
            }
        }
    }
    
    static func vertical(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: (UIView) -> [UIView?]) -> UIStackView {
        .stack(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
    }
    
    static func vStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: (UIView) -> [UIView?]) -> UIStackView {
        .stack(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
    }
    
    static func horizontal(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: (UIView) -> [UIView?]) -> UIStackView {
        .stack(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
    }
    static func hStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: (UIView) -> [UIView?]) -> UIStackView {
        .stack(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
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
