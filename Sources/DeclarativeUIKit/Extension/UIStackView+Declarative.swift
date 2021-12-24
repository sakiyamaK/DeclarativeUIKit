import UIKit.UIStackView

public extension UIStackView {
    static func stack(axis: NSLayoutConstraint.Axis = .vertical, alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> UIStackView {
        UIStackView.build {
            guard let stackView = $0 as? UIStackView else { return }
            stackView.backgroundColor = .clear
            stackView.axis = axis
            stackView.alignment = alignment
            stackView.distribution = distribution
            builder().compactMap { $0 }.forEach {
                stackView.addArrangedSubview($0)
            }
        }
    }

    static func vStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> UIStackView {
        .stack(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
    }

    static func hStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> UIStackView {
        .stack(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
    }

    static func zStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: () -> [UIView?]) -> UIStackView {
        UIStackView.build {
            guard let stackView = $0 as? UIStackView else { return }
            stackView.alignment = alignment
            stackView.distribution = distribution
            builder().compactMap { $0 }.forEach {
                stackView.addSubview($0)
            }
        }
    }
}
