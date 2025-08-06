import UIKit.UIStackView
import UIKit

public extension UIStackView {
    private func addArrangedSubViewHandlingHelperCustomSpacing(_ view: UIView) {

        view.translatesAutoresizingMaskIntoConstraints = false
        self.addArrangedSubview(view)

        // 最後のcustomSpacingを取得
        if let customSpacingView = view.subviews.compactMap({ $0 as? HelperCustomSpacingView }).last {
            self.setCustomSpacing(customSpacingView.customSpacing, after: view)
            // customSpacingを全て削除
            view.subviews.compactMap({ $0 as? HelperCustomSpacingView }).forEach {
                $0.removeFromSuperview()
            }
        }
    }

    private func set(axis: NSLayoutConstraint.Axis = .vertical, alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: @escaping () -> [UIView?] = {() in []}) {
        self.backgroundColor = .clear
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        builder().compactMap { $0 }.forEach {
            self.addArrangedSubViewHandlingHelperCustomSpacing($0)
        }
    }

    private func set(axis: NSLayoutConstraint.Axis = .vertical, alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builderAsync: @escaping () async -> [UIView?] = {() in []}) async {
        self.backgroundColor = .clear
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        await builderAsync().compactMap { $0 }.forEach {
            self.addArrangedSubViewHandlingHelperCustomSpacing($0)
        }
    }

    convenience init(axis: NSLayoutConstraint.Axis = .vertical, alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: @escaping () -> [UIView?] = {() in []}) {
        self.init(frame: .zero)
        self.set(axis: axis, alignment: alignment, distribution: distribution, spacing: spacing, builder)
    }
    
    convenience init(axis: NSLayoutConstraint.Axis = .vertical, alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builderAsync: @escaping () async -> [UIView?] = {() in []}) async {
        self.init(frame: .zero)
        await self.set(axis: axis, alignment: alignment, distribution: distribution, spacing: spacing, builderAsync)
    }

    static func vertical(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping () -> [UIView?] = {() in []}) -> UIStackView {
        if isTouchTransparency {
            HelperTouchTransparencyStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        } else {
            UIStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        }
    }

    static func vertical(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builderAsync: @escaping () async -> [UIView?] = {() in []}) async -> UIStackView {
        if isTouchTransparency {
            await HelperTouchTransparencyStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builderAsync)
        } else {
            await UIStackView(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builderAsync)
        }
    }
    
    static func vStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping () -> [UIView?] = {() in []}) -> UIStackView {
        UIStackView.vertical(alignment: alignment, distribution: distribution, spacing: spacing, isTouchTransparency: isTouchTransparency, builder)
    }
    
    static func vStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builderAsync: @escaping () async -> [UIView?] = {() in []}) async -> UIStackView {
        await UIStackView.vertical(alignment: alignment, distribution: distribution, spacing: spacing, isTouchTransparency: isTouchTransparency, builderAsync)
    }

    static func horizontal(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping () -> [UIView?] = {() in []}) -> UIStackView {
        if isTouchTransparency {
            HelperTouchTransparencyStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        } else {
            UIStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        }
    }
    
    static func horizontal(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builderAsync: @escaping () async -> [UIView?] = {() in []}) async -> UIStackView {
        if isTouchTransparency {
            await HelperTouchTransparencyStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builderAsync)
        } else {
            await UIStackView(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builderAsync)
        }
    }
    
    static func hStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builder: @escaping () -> [UIView?] = {() in []}) -> UIStackView {
        UIStackView.horizontal(alignment: alignment, distribution: distribution, spacing: spacing, isTouchTransparency: isTouchTransparency, builder)
    }
    
    static func hStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, isTouchTransparency: Bool = false, @ArrayUIViewBuilder _ builderAsync: @escaping () async -> [UIView?] = {() in []}) async -> UIStackView {
        await UIStackView.horizontal(alignment: alignment, distribution: distribution, spacing: spacing, isTouchTransparency: isTouchTransparency, builderAsync)
    }

    @discardableResult
    func vertical(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: @escaping () -> [UIView?] = {() in []}) -> UIStackView {
        self.set(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        return self
    }

    @discardableResult
    func vertical(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builderAsync: @escaping () async -> [UIView?] = {() in []}) async -> UIStackView {
        await self.set(axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing, builderAsync)
        return self
    }

    @discardableResult
    func vStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: @escaping () -> [UIView?] = {() in []}) -> UIStackView {
        self.vertical(alignment: alignment, distribution: distribution, spacing: spacing, builder)
    }

    @discardableResult
    func vStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builderAsync: @escaping () async -> [UIView?] = {() in []}) async -> UIStackView {
        await self.vertical(alignment: alignment, distribution: distribution, spacing: spacing, builderAsync)
    }

    @discardableResult
    func horizontal(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: @escaping () -> [UIView?] = {() in []}) -> UIStackView {
        self.set(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builder)
        return self
    }

    @discardableResult
    func horizontal(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builderAsync: @escaping () async -> [UIView?] = {() in []}) async -> UIStackView {
        await self.set(axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing, builderAsync)
        return self
    }

    @discardableResult
    func hStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builder: @escaping () -> [UIView?] = {() in []}) -> UIStackView {
        self.horizontal(alignment: alignment, distribution: distribution, spacing: spacing, builder)
    }

    @discardableResult
    func hStack(alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0.0, @ArrayUIViewBuilder _ builderAsync: @escaping () async -> [UIView?] = {() in []}) async -> UIStackView {
        await self.horizontal(alignment: alignment, distribution: distribution, spacing: spacing, builderAsync)
    }

    @discardableResult
    func addArrangedSubviews(@ArrayUIViewBuilder _ builder: () -> [UIView]) -> Self {
        builder().forEach {
            self.addArrangedSubViewHandlingHelperCustomSpacing($0)
        }
        return self
    }

    @discardableResult
    func addArrangedSubviews(@ArrayUIViewBuilder _ builderAsync: () async -> [UIView]) async -> Self {
        let views = await builderAsync()
        return self.addArrangedSubviews { views }
    }

    @discardableResult
    func replaceArrangedSubviews(offset: Int = 0, @ArrayUIViewBuilder _ builder: () -> [UIView]) -> Self {
        let offset = max(0, min(offset, self.arrangedSubviews.count-1))
        self.arrangedSubviews[offset...].forEach {
            $0.removeFromSuperview()
        }
        return self.addArrangedSubviews {
            builder()
        }
    }

    @discardableResult
    func replaceArrangedSubviews(offset: Int = 0, @ArrayUIViewBuilder _ builderAsync: () async -> [UIView]) async -> Self {
        let offset = max(0, min(offset, self.arrangedSubviews.count-1))
        self.arrangedSubviews[offset...].forEach {
            $0.removeFromSuperview()
        }
        return await self.addArrangedSubviews {
            await builderAsync()
        }
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
            self.addArrangedSubViewHandlingHelperCustomSpacing($0)
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
            self.addArrangedSubViewHandlingHelperCustomSpacing($0)
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

    @discardableResult
    func addArrangedSubviews(@ArrayUIViewBuilder _ builder: (UIStackView) -> [UIView]) -> Self {
        builder(self).forEach {
            self.addArrangedSubViewHandlingHelperCustomSpacing($0)
        }
        return self
    }

    @discardableResult
    func addArrangedSubviews(@ArrayUIViewBuilder _ builderAsync: (UIStackView) async -> [UIView]) async -> Self {
        await builderAsync(self).forEach {
            self.addArrangedSubViewHandlingHelperCustomSpacing($0)
        }
        return self
    }

    @discardableResult
    func replaceArrangedSubviews(offset: Int = 0, @ArrayUIViewBuilder _ builder: (UIStackView) -> [UIView]) -> Self {
        let offset = max(0, min(offset, self.arrangedSubviews.count-1))
        self.arrangedSubviews[offset...].forEach {
            $0.removeFromSuperview()
        }
        return self.addArrangedSubviews {
            builder(self)
        }
    }

    @discardableResult
    func replaceArrangedSubviews(offset: Int = 0, @ArrayUIViewBuilder _ builderAsync: (UIStackView) async -> [UIView]) async -> Self {
        let offset = max(0, min(offset, self.arrangedSubviews.count-1))
        self.arrangedSubviews[offset...].forEach {
            $0.removeFromSuperview()
        }
        return await self.addArrangedSubviews {
            await builderAsync(self)
        }
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
