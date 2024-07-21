//
//  UISearchBar.swift
//  
//
//  Created by sakiyamaK on 2022/11/21.
//

import UIKit.UISearchBar

//MARK: - Declarative method
public extension UISearchBar {
    
    @discardableResult
    func barStyle(_ barStyle: UIBarStyle) -> Self {
        self.barStyle = barStyle
        return self
    }
    
    @discardableResult
    func delegate(_ delegate: UISearchBarDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    
    @discardableResult
    func text(_ text: String?) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    func prompt(_ prompt: String?) -> Self {
        self.prompt = prompt
        return self
    }
    
    @discardableResult
    func placeholder(_ placeholder: String?) -> Self {
        self.placeholder = placeholder
        return self
    }
    
    @discardableResult
    func showsBookmarkButton(_ showsBookmarkButton: Bool) -> Self {
        self.showsBookmarkButton = showsBookmarkButton
        return self
    }
    
    @discardableResult
    func showsCancelButton(_ showsCancelButton: Bool) -> Self {
        self.showsCancelButton = showsCancelButton
        return self
    }
    
    @discardableResult
    func showsSearchResultsButton(_ showsSearchResultsButton: Bool) -> Self {
        self.showsSearchResultsButton = showsSearchResultsButton
        return self
    }
    
    @discardableResult
    func isSearchResultsButtonSelected(_ isSearchResultsButtonSelected: Bool) -> Self {
        self.isSearchResultsButtonSelected = isSearchResultsButtonSelected
        return self
    }
    
    @discardableResult
    func showsCancelButton(_ showsCancelButton: Bool, animated: Bool) -> Self {
        self.setShowsCancelButton(showsCancelButton, animated: animated)
        return self
    }
        
    @discardableResult
    func barTintColor(_ barTintColor: UIColor?) -> Self {
        self.barTintColor = barTintColor
        return self
    }
    
    @discardableResult
    func searchBarStyle(_ searchBarStyle: UISearchBar.Style) -> Self {
        self.searchBarStyle = searchBarStyle
        return self
    }
    
    @discardableResult
    func isTranslucent(_ isTranslucent: Bool) -> Self {
        self.isTranslucent = isTranslucent
        return self
    }
    
    @discardableResult
    func scopeButtonTitles(_ scopeButtonTitles: [String]?) -> Self {
        self.scopeButtonTitles = scopeButtonTitles
        return self
    }
    
    @discardableResult
    func selectedScopeButtonIndex(_ selectedScopeButtonIndex: Int) -> Self {
        self.selectedScopeButtonIndex = selectedScopeButtonIndex
        return self
    }
    
    @discardableResult
    func showsScopeBar(_ showsScopeBar: Bool) -> Self {
        self.showsScopeBar = showsScopeBar
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func showsCanselButton(_ show: Bool, animated animate: Bool) -> Self {
        self.setShowsCancelButton(show, animated: animate)
        return self
    }
    
    @discardableResult
    func inputAccessoryView(_ inputAccessoryView: UIView?) -> Self {
        self.inputAccessoryView = inputAccessoryView
        return self
    }
    
    @discardableResult
    func backgroundImage(_ backgroundImage: UIImage?) -> Self {
        self.backgroundImage = backgroundImage
        return self
    }
    
    @discardableResult
    func scopeBarBackgroundImage(_ scopeBarBackgroundImage: UIImage?) -> Self {
        self.scopeBarBackgroundImage = scopeBarBackgroundImage
        return self
    }
    
    @discardableResult
    func backgroundImage(_ backgroundImage: UIImage?, for barPosition: UIBarPosition, barMetrics: UIBarMetrics) -> Self {
        self.setBackgroundImage(backgroundImage, for: barPosition, barMetrics: barMetrics)
        return self
    }
    
    @discardableResult
    func searchFieldBackgroundImage(_ backgroundImage: UIImage?, for state: UIControl.State) -> Self {
        self.setSearchFieldBackgroundImage(backgroundImage, for: state)
        return self
    }
    
    @discardableResult
    func image(_ iconImage: UIImage?, for icon: UISearchBar.Icon, state: UIControl.State) -> Self {
        self.setImage(iconImage, for: icon, state: state)
        return self
    }
    
    @discardableResult
    func scopeBarButtonBackgroundImage(_ backgroundImage: UIImage?, for state: UIControl.State) -> Self {
        self.setScopeBarButtonBackgroundImage(backgroundImage, for: state)
        return self
    }
    
    @discardableResult
    func scopeBarButtonDividerImage(_ dividerImage: UIImage?, forLeftSegmentState leftState: UIControl.State, rightSegmentState rightState: UIControl.State) -> Self {
        self.setScopeBarButtonDividerImage(dividerImage, forLeftSegmentState: leftState, rightSegmentState: rightState)
        return self
    }
    
    @discardableResult
    func scopeBarButtonTitleTextAttributes(_ attributes: [NSAttributedString.Key : Any]?, for state: UIControl.State) -> Self {
        self.setScopeBarButtonTitleTextAttributes(attributes, for: state)
        return self
    }
    
    @discardableResult
    func searchFieldBackgroundPositionAdjustment(_ searchFieldBackgroundPositionAdjustment: UIOffset) -> Self {
        self.searchFieldBackgroundPositionAdjustment = searchFieldBackgroundPositionAdjustment
        return self
    }
    
    @discardableResult
    func searchTextPositionAdjustment(_ searchTextPositionAdjustment: UIOffset) -> Self {
        self.searchTextPositionAdjustment = searchTextPositionAdjustment
        return self
    }
    
    @discardableResult
    func positionAdjustment(_ adjustment: UIOffset, for icon: UISearchBar.Icon) -> Self {
        self.setPositionAdjustment(adjustment, for: icon)
        return self
    }
}
