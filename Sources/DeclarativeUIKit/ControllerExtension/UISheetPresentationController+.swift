//
//  UISheetPresentationController+.swift
//  
//
//  Created by sakiyamaK on 2023/04/16.
//

import UIKit

public extension UISheetPresentationController {
    
    @discardableResult
    func delegate(_ delegate: UISheetPresentationControllerDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    
    @discardableResult
    func sourceView(_ sourceView: UIView?) -> Self {
        self.sourceView = sourceView
        return self
    }
    
    @discardableResult
    func prefersEdgeAttachedInCompactHeight(_ prefersEdgeAttachedInCompactHeight: Bool) -> Self {
        self.prefersEdgeAttachedInCompactHeight = prefersEdgeAttachedInCompactHeight
        return self
    }
    
    @discardableResult
    func widthFollowsPreferredContentSizeWhenEdgeAttached(_ widthFollowsPreferredContentSizeWhenEdgeAttached: Bool) -> Self {
        self.widthFollowsPreferredContentSizeWhenEdgeAttached = widthFollowsPreferredContentSizeWhenEdgeAttached
        return self
    }
    
    @discardableResult
    func prefersGrabberVisible(_ prefersGrabberVisible: Bool) -> Self {
        self.prefersGrabberVisible = prefersGrabberVisible
        return self
    }

    @discardableResult
    func detents(_ detents: [UISheetPresentationController.Detent]) -> Self {
        self.detents = detents
        return self
    }
        
    @discardableResult
    func selectedDetentIdentifier(_ selectedDetentIdentifier: UISheetPresentationController.Detent.Identifier?) -> Self {
        self.selectedDetentIdentifier = selectedDetentIdentifier
        return self
    }
    
    @discardableResult
    func largestUndimmedDetentIdentifier(_ largestUndimmedDetentIdentifier: UISheetPresentationController.Detent.Identifier?) -> Self {
        self.largestUndimmedDetentIdentifier = largestUndimmedDetentIdentifier
        return self
    }
    
    @discardableResult
    func prefersScrollingExpandsWhenScrolledToEdge(_ prefersScrollingExpandsWhenScrolledToEdge: Bool) -> Self {
        self.prefersScrollingExpandsWhenScrolledToEdge = prefersScrollingExpandsWhenScrolledToEdge
        return self
    }
    
    @discardableResult
    func preferredCornerRadius(_ preferredCornerRadius: CGFloat?) -> Self {
        self.preferredCornerRadius = preferredCornerRadius
        return self
    }
}
