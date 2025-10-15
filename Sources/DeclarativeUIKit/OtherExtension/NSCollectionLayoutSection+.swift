//
//  NSCollectionLayoutSection+.swift
//  DeclarativeUIKit
//
//  Created by sakiyamaK on 2025/01/14.
//

import UIKit

import UIKit

public extension NSCollectionLayoutSection {
    @discardableResult
    func boundarySupplementaryItems(_ boundarySupplementaryItemsBuilder: (() -> [NSCollectionLayoutBoundarySupplementaryItem])) -> Self {
        self.boundarySupplementaryItems = boundarySupplementaryItemsBuilder()
        return self
    }

    @discardableResult
    func boundarySupplementaryItems(_ boundarySupplementaryItemsBuilderAsync: (() async -> [NSCollectionLayoutBoundarySupplementaryItem])) async -> Self {
        self.boundarySupplementaryItems = await boundarySupplementaryItemsBuilderAsync()
        return self
    }

    @discardableResult
    func decorationItems(_ decorationItemsBuilder: (() -> [NSCollectionLayoutDecorationItem])) -> Self {
        self.decorationItems = decorationItemsBuilder()
        return self
    }

    @discardableResult
    func decorationItems(_ decorationItemsBuilderAsync: (() async -> [NSCollectionLayoutDecorationItem])) async -> Self {
        self.decorationItems = await decorationItemsBuilderAsync()
        return self
    }

    @discardableResult
    func contentInsets(_ contentInsets: NSDirectionalEdgeInsets) -> Self {
        self.contentInsets = contentInsets
        return self
    }

    @discardableResult
    func interGroupSpacing(_ interGroupSpacing: CGFloat) -> Self {
        self.interGroupSpacing = interGroupSpacing
        return self
    }

    @discardableResult
    func contentInsetsReference(_ contentInsetsReference: UIContentInsetsReference) -> Self {
        self.contentInsetsReference = contentInsetsReference
        return self
    }

    @available(iOS 16.0, *)
    @discardableResult
    func supplementaryContentInsetsReference(_ supplementaryContentInsetsReference: UIContentInsetsReference) -> Self {
        self.supplementaryContentInsetsReference = supplementaryContentInsetsReference
        return self
    }

    @discardableResult
    func orthogonalScrollingBehavior(_ orthogonalScrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior) -> Self {
        self.orthogonalScrollingBehavior = orthogonalScrollingBehavior
        return self
    }

    @available(iOS 17.0, *)
    @discardableResult
    func applyOrthogonalScrollingProperties(_ orthogonalScrollingProperties: (UICollectionLayoutSectionOrthogonalScrollingProperties) -> Void) -> Self {
        orthogonalScrollingProperties(self.orthogonalScrollingProperties)
        return self
    }

    @discardableResult
    func visibleItemsInvalidationHandler(_ visibleItemsInvalidationHandler: NSCollectionLayoutSectionVisibleItemsInvalidationHandler?) -> Self {
        self.visibleItemsInvalidationHandler = visibleItemsInvalidationHandler
        return self
    }
}
