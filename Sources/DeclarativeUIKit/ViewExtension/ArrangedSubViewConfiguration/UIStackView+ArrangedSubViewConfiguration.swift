//
//  UIStackView+ArrangedSubViewConfiguration.swift
//  DeclarativeUIKit
//
//  Created by sakiyamaK on 2025/04/26.
//

import UIKit

@available(iOS 15.0, *)
public extension UIStackView {
    public struct ArrangedSubViewConfiguration {
        var font: UIFont?
        var numberOnLines: Int?
        var contentPriorities: UIContentPriorities?

        public init(
            font: UIFont? = nil,
            numberOnLines: Int? = nil,
            contentPriorities: UIContentPriorities? = nil
        ) {
            self.font = font
            self.numberOnLines =  numberOnLines
            self.contentPriorities = contentPriorities
        }

        public func setup(view: UIView) {
            if let font, let fontableView = view as? Fontable {
                fontableView.set(font: font)
            }
            if let contentPriorities, view.isDefaultContentPirorities {
                view.contentPriorities(contentPriorities)
            }
        }
    }

    private func _addArrangedSubview(_ _view: UIView, _ _configuration: UIStackView.ArrangedSubViewConfiguration? = nil) {
        if let customSpacingView = _view as? HelperCustomSpacingView, let view = customSpacingView.subviews.first {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addArrangedSubview(view)
            self.setCustomSpacing(customSpacingView.customSpacing, after: view)
            self._addArrangedSubview(view, _configuration)
        } else if let _configuration {
            _configuration.setup(view: _view)
            self.addArrangedSubview(_view)
        } else {
            _view.translatesAutoresizingMaskIntoConstraints = false
            self.addArrangedSubview(_view)
        }
    }

    convenience init(
        axis: NSLayoutConstraint.Axis = .vertical,
        alignment: Alignment = .fill,
        distribution: Distribution = .fill,
        spacing: CGFloat = 0.0,
        arrangedSubViewConfiguration: ArrangedSubViewConfiguration?,
        @ArrayUIViewBuilder _ builder: @escaping () -> [UIView?]
    ) {
        self.init(frame: .zero)
        self.backgroundColor = .clear
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        builder().compactMap { $0 }.forEach {
            _addArrangedSubview($0, arrangedSubViewConfiguration)
        }
    }

    convenience init(
        axis: NSLayoutConstraint.Axis = .vertical,
        alignment: Alignment = .fill,
        distribution: Distribution = .fill,
        spacing: CGFloat = 0.0,
        arrangedSubViewConfiguration: ArrangedSubViewConfiguration?,
        @ArrayUIViewBuilder _ builderAsync: @escaping () async -> [UIView?]
    ) async {
        self.init(frame: .zero)
        self.backgroundColor = .clear
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        await builderAsync().compactMap { $0 }.forEach {
            _addArrangedSubview($0, arrangedSubViewConfiguration)
        }
    }
}

private extension UIView {
    var isDefaultContentPirorities: Bool {
        let hh = self.contentHuggingPriority(for: .horizontal)
        let hv = self.contentHuggingPriority(for: .vertical)
        let crh = self.contentCompressionResistancePriority(for: .horizontal)
        let crv = self.contentCompressionResistancePriority(for: .vertical)

        let defaultView = Self()

        return hh == defaultView.contentHuggingPriority(for: .horizontal) &&
        hv == defaultView.contentHuggingPriority(for: .vertical) &&
        crh == defaultView.contentCompressionResistancePriority(for: .horizontal) &&
        crv == defaultView.contentCompressionResistancePriority(for: .vertical)
    }
}
