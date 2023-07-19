//
//  UIPopoverPresentationController.swift
//  
//
//  Created by sakiyamaK on 2023/07/19.
//

import UIKit.UIPopoverPresentationController

public extension UIPopoverPresentationController {
    @discardableResult
    func delegate(_ delegate: UIPopoverPresentationControllerDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    
    @discardableResult
    func permittedArrowDirections(_ permittedArrowDirections: UIPopoverArrowDirection) -> Self {
        self.permittedArrowDirections = permittedArrowDirections
        return self
    }
    
    @discardableResult
    func sourceView(_ sourceView: UIView?) -> Self {
        self.sourceView = sourceView
        return self
    }
    
    @discardableResult
    func sourceRect(_ sourceRect: CGRect) -> Self {
        self.sourceRect = sourceRect
        return self
    }
    
    @discardableResult
    func canOverlapSourceViewRect(_ canOverlapSourceViewRect: Bool) -> Self {
        self.canOverlapSourceViewRect = canOverlapSourceViewRect
        return self
    }
    
    @available(iOS 16.0, *)
    @discardableResult
    func sourceItem(_ sourceItem: UIPopoverPresentationControllerSourceItem?) -> Self {
        self.sourceItem = sourceItem
        return self
    }
        
    @available(iOS, introduced: 8.0, deprecated: 100000)
    @discardableResult
    func barButtonItem(_ barButtonItem: UIBarButtonItem?) -> Self {
        self.barButtonItem = barButtonItem
        return self
    }
    
    @discardableResult
    func passthroughViews(_ passthroughViews: [UIView]?) -> Self {
        self.passthroughViews = passthroughViews
        return self
    }
    
    @discardableResult
    func backgroundColor(_ backgroundColor: UIColor?) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    
    @discardableResult
    func popoverLayoutMargins(_ popoverLayoutMargins: UIEdgeInsets) -> Self {
        self.popoverLayoutMargins = popoverLayoutMargins
        return self
    }
    
    @discardableResult
    func popoverBackgroundViewClass(_ popoverBackgroundViewClass: UIPopoverBackgroundViewMethods.Type?) -> Self {
        self.popoverBackgroundViewClass = popoverBackgroundViewClass
        return self
    }
    
    @discardableResult
    func applyArrowDirection(_ configure: ((UIPopoverArrowDirection) -> Void)) -> Self {
        configure(self.arrowDirection)
        return self
    }
    
    @available(iOS 15.0, *)
    @discardableResult
    func applyAdaptiveSheetPresentationController(_ configure: ((UISheetPresentationController) -> Void)) -> Self {
        configure(self.adaptiveSheetPresentationController)
        return self
    }
}

