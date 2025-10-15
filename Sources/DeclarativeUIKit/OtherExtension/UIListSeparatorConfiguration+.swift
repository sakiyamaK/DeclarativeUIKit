//
//  UIListSeparatorConfiguration+.swift
//  DeclarativeUIKit
//
//  Created by sakiyamaK on 2025/01/14.
//

import UIKit

public extension UIListSeparatorConfiguration {
    @discardableResult
    func topSeparatorVisibility(_ topSeparatorVisibility: UIListSeparatorConfiguration.Visibility) -> Self {
        var _self = self
        _self.topSeparatorVisibility = topSeparatorVisibility
        return _self
    }

    @discardableResult
    func topSeparatorInsets(_ topSeparatorInsets: NSDirectionalEdgeInsets) -> Self {
        var _self = self
        _self.topSeparatorInsets = topSeparatorInsets
        return _self
    }

    @discardableResult
    func bottomSeparatorVisibility(_ bottomSeparatorVisibility: UIListSeparatorConfiguration.Visibility) -> Self {
        var _self = self
        _self.bottomSeparatorVisibility = bottomSeparatorVisibility
        return _self
    }

    @discardableResult
    func bottomSeparatorInsets(_ bottomSeparatorInsets: NSDirectionalEdgeInsets) -> Self {
        var _self = self
        _self.bottomSeparatorInsets = bottomSeparatorInsets
        return _self
    }

    @discardableResult
    func color(_ color: UIColor) -> Self {
        var _self = self
        _self.color = color
        return _self
    }

    @discardableResult
    func multipleSelectionColor(_ multipleSelectionColor: UIColor) -> Self {
        var _self = self
        _self.multipleSelectionColor = multipleSelectionColor
        return _self
    }

    @available(tvOS, unavailable)
    @discardableResult
    func visualEffect(_ visualEffect: UIVisualEffect?) -> Self {
        var _self = self
        _self.visualEffect = visualEffect
        return _self
    }
}
