//
//  UISearchTextField+.swift
//  
//
//  Created by sakiyamaK on 2024/07/21.
//

import UIKit.UISearchTextField

public extension UISearchTextField {

    @discardableResult
    func tokes(_ tokens: [UISearchToken]) -> Self {
        self.tokens = tokens
        return self
    }

    @discardableResult
    func insert(token: UISearchToken, at tokenIndex: Int) -> Self {
        self.insertToken(token, at: tokenIndex)
        return self
    }

    @discardableResult
    func removeToken(index: Int) -> Self {
        self.removeToken(at: index)
        return self
    }


    @discardableResult
    func replaceTextualPortion(textRange: UITextRange, with token: UISearchToken, at tokenIndex: Int) -> Self {
        self.replaceTextualPortion(of: textRange, with: token, at: tokenIndex)
        return self
    }

    @discardableResult
    func tokenBackgroundColor(_ tokenBackgroundColor: UIColor) -> Self {
        self.tokenBackgroundColor = tokenBackgroundColor
        return self
    }

    @discardableResult
    func allowsDeletingTokens(_ allowsDeletingTokens: Bool) -> Self {
        self.allowsDeletingTokens = allowsDeletingTokens
        return self
    }

    @discardableResult
    func allowsCopyingTokens(_ allowsCopyingTokens: Bool) -> Self {
        self.allowsCopyingTokens = allowsCopyingTokens
        return self
    }

    @discardableResult
    @available(iOS 16.0, *)
    func searchSuggestions(_ searchSuggestions: [any UISearchSuggestion]?) -> Self {
        self.searchSuggestions = searchSuggestions
        return self
    }
}
