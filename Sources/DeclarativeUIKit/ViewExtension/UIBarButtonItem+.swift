//
//  UIBarButtonItem+.swift
//  
//
//  Created by sakiyamaK on 2023/07/02.
//

import UIKit.UIBarButtonItem

public extension UIBarButtonItem {
    
    convenience init(barButtonSystemItem: SystemItem) {
        self.init(barButtonSystemItem: barButtonSystemItem, target: nil, action: nil)
    }

    convenience init(title: String?, style: Style, target: AnyObject?, actionBuilder: () -> Selector?) {
        self.init(title: title, style: style, target: target, action: actionBuilder())
    }
    
    convenience init(title: String?, style: Style) {
        self.init(title: title, style: style, target: nil, action: nil)
    }
    
    convenience init(image: UIImage?, style: Style, target: AnyObject?, actionBuilder: () -> Selector?) {
        self.init(image: image, style: style, target: target, action: actionBuilder())
    }
    
    convenience init(image: UIImage?, style: Style) {
        self.init(image: image, style: style, target: nil, action: nil)
    }
    
    convenience init(image: UIImage?, landscapeImagePhone: UIImage?, style: Style, target: Any?, actionBuilder: () -> Selector?) {
        self.init(image: image, landscapeImagePhone: landscapeImagePhone, style: style, target: target, action: actionBuilder())
    }
    
    convenience init(image: UIImage?, landscapeImagePhone: UIImage?, style: Style) {
        self.init(image: image, landscapeImagePhone: landscapeImagePhone, style: style, target: nil, action: nil)
    }

}

public extension UIBarButtonItem {
    @discardableResult
    func customView(_ customView: UIView) -> Self {
        self.customView = customView
        return self
    }
    
    @discardableResult
    func primaryAction(_ primaryAction: UIAction?) -> Self {
        self.primaryAction = primaryAction
        return self
    }
    
    @discardableResult
    func changesSelectionAsPrimaryAction(_ changesSelectionAsPrimaryAction: Bool) -> Self {
        self.changesSelectionAsPrimaryAction = changesSelectionAsPrimaryAction
        return self
    }
    
    @discardableResult
    func action(_ action: Selector?) -> Self {
        self.action = action
        return self
    }
    
    @discardableResult
    func action(_ actionBuilder: () -> Selector) -> Self {
        self.action(actionBuilder())
    }
    
    @discardableResult
    func action(_ action: @escaping ((Any) -> Void)) -> Self {
        guard let target else { return self }
        let handler = ActionHandler(sender: self, target: target, action: action)
        return self.target(handler).action(ActionHandler.selector)
    }
        
    @discardableResult
    func target(_ target: AnyObject?) -> Self {
        self.target = target
        return self
    }
    
    @discardableResult
    func action(_ target: AnyObject?, _ action: @escaping ((Any) -> Void)) -> Self {
        guard let target else { return self }
        let handler = ActionHandler(sender: self, target: target, action: action)
        return self.target(handler).action(ActionHandler.selector)
    }
    
    @discardableResult
    func style(_ style: UIBarButtonItem.Style) -> Self {
        self.style = style
        return self
    }
    
    @discardableResult
    func tintColor(_ tintColor: UIColor?) -> Self {
        self.tintColor = tintColor
        return self
    }
    
    @discardableResult
    func width(_ width: CGFloat) -> Self {
        self.width = width
        return self
    }
    
    @discardableResult
    func possibleTitles(_ possibleTitles: Set<String>?) -> Self {
        self.possibleTitles = possibleTitles
        return self
    }
    
    func backButtonBackgroundImage(_ backButtonBackgroundImage: UIImage?, for: UIControl.State, barMetrics: UIBarMetrics) -> Self {
        self.setBackButtonBackgroundImage(backButtonBackgroundImage, for: `for`, barMetrics: barMetrics)
        return self
    }
    
    func backButtonTitlePositionAdjustment(_ adjustment: UIOffset, for: UIBarMetrics) -> Self {
        self.setBackButtonTitlePositionAdjustment(adjustment, for: `for`)
        return self
    }
    
    func backButtonBackgroundVerticalPositionAdjustment(_ adjustment: CGFloat, for: UIBarMetrics) -> Self {
        self.setBackButtonBackgroundVerticalPositionAdjustment(adjustment, for: `for`)
        return self
    }
    
    func backgroundVerticalPositionAdjustment(_ adjustment: CGFloat, for: UIBarMetrics) -> Self {
        self.setBackgroundVerticalPositionAdjustment(adjustment, for: `for`)
        return self
    }
    
    func backgroundImage(_ backgroundImage: UIImage?, for: UIControl.State, barMetrics: UIBarMetrics) -> Self {
        self.setBackgroundImage(backgroundImage, for: `for`, barMetrics: barMetrics)
        return self
    }
    
    func backgroundImage(_ backgroundImage: UIImage?, for: UIControl.State, style: UIBarButtonItem.Style, barMetrics: UIBarMetrics) -> Self {
        self.setBackgroundImage(backgroundImage, for: `for`, style: style, barMetrics: barMetrics)
        return self
    }
    
    func titlePositionAdjustment(_ adjustment: UIOffset, for: UIBarMetrics) -> Self {
        self.setTitlePositionAdjustment(adjustment, for: `for`)
        return self
    }
}

@available(iOS 15.0, *)
public extension UIBarButtonItem {
    @discardableResult
    func isSelected(_ isSelected: Bool) -> Self {
        self.isSelected = isSelected
        return self
    }
}

@available(iOS 16.0, *)
public extension UIBarButtonItem {
    convenience init(title: String?, image: UIImage?, target: AnyObject?, actionBuilder: () -> Selector?, menu: UIMenu?) {
        self.init(title: title, image: image, target: target, action: actionBuilder(), menu: menu)
    }
    
    @discardableResult
    func menu(_ menu: UIMenu) -> Self {
        self.menu = menu
        return self
    }

    @discardableResult
    func preferredMenuElementOrder(_ preferredMenuElementOrder: UIContextMenuConfiguration.ElementOrder) -> Self {
        self.preferredMenuElementOrder = preferredMenuElementOrder
        return self
    }
    
    @discardableResult
    func isHidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }
    
    func menuRepresentation(_ menuRepresentation: UIMenuElement?) -> Self {
        self.menuRepresentation = menuRepresentation
        return self
    }
}
