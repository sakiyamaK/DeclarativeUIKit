//
//  UICollectionLayoutListConfiguration+.swift
//
//
//  Created by sakiyamaK on 2024/03/19.
//

import UIKit

@available(iOS 14.0, *)
public extension UICollectionLayoutListConfiguration {
    @discardableResult
    func showsSeparators(_ showsSeparators: Bool) -> Self {
        var _self = self
        _self.showsSeparators = showsSeparators
        return _self
    }
    
    @available(iOS 14.5, *)
    @discardableResult
    func separatorConfiguration(_ separatorConfiguration: UIListSeparatorConfiguration) -> Self {
        var _self = self
        _self.separatorConfiguration = separatorConfiguration
        return _self
    }

    @available(iOS 14.5, *)
    @discardableResult
    func itemSeparatorHandler(_ itemSeparatorHandler: UICollectionLayoutListConfiguration.ItemSeparatorHandler?) -> Self {
        var _self = self
        _self.itemSeparatorHandler = itemSeparatorHandler
        return _self
    }

    @discardableResult
    func backgroundColor(_ backgroundColor: UIColor?) -> Self {
        var _self = self
        _self.backgroundColor = backgroundColor
        return _self
    }

    @discardableResult
    func headerMode(_ footerMode: UICollectionLayoutListConfiguration.HeaderMode) -> Self {
        var _self = self
        _self.headerMode = footerMode
        return _self
    }

    @discardableResult
    func footerMode(_ footerMode: UICollectionLayoutListConfiguration.FooterMode) -> Self {
        var _self = self
        _self.footerMode = footerMode
        return _self
    }
    
    @discardableResult
    func leadingSwipeActionsConfigurationProvider(
        _ leadingSwipeActionsConfigurationProvider: UICollectionLayoutListConfiguration.SwipeActionsConfigurationProvider?
    ) -> Self {
        var _self = self
        _self.leadingSwipeActionsConfigurationProvider = leadingSwipeActionsConfigurationProvider
        return _self
    }

    @discardableResult
    func trailingSwipeActionsConfigurationProvider(
        _ trailingSwipeActionsConfigurationProvider: UICollectionLayoutListConfiguration.SwipeActionsConfigurationProvider?
    ) -> Self {
        var _self = self
        _self.trailingSwipeActionsConfigurationProvider = trailingSwipeActionsConfigurationProvider
        return _self
    }
    
    @available(iOS 15.0, *)
    @discardableResult
    func headerTopPadding(_ headerTopPadding: CGFloat?) -> Self {
        var _self = self
        _self.headerTopPadding = headerTopPadding
        return _self
    }
}

