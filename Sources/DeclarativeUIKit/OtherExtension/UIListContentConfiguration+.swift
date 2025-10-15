//
//  UIListContentConfiguration+.swift
//
//
//  Created by sakiyamaK on 2024/05/26.
//

import UIKit.UIListContentConfiguration

public extension UIListContentConfiguration {
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        var me = self
        me.image = image
        return me
    }
    @discardableResult
    func imageProperties(_ imageProperties: UIListContentConfiguration.ImageProperties) -> Self {
        var me = self
        me.imageProperties = imageProperties
        return me
    }
    @discardableResult
    func text(_ text: String) -> Self {
        var me = self
        me.text = text
        return me
    }
    @discardableResult
    func text(_ attributedText: NSAttributedString) -> Self {
        var me = self
        me.attributedText = attributedText
        return me
    }
    @discardableResult
    func attributedText(_ attributedText: NSAttributedString) -> Self {
        var me = self
        me.attributedText = attributedText
        return me
    }
    @discardableResult
    func textProperties(_ textProperties: UIListContentConfiguration.TextProperties) -> Self {
        var me = self
        me.textProperties = textProperties
        return me
    }
    @discardableResult
    func secondaryText(_ secondaryText: String) -> Self {
        var me = self
        me.secondaryText = secondaryText
        return me
    }
    @discardableResult
    func secondaryText(_ secondaryText: NSAttributedString) -> Self {
        var me = self
        me.secondaryAttributedText = secondaryText
        return me
    }
    @discardableResult
    func secondaryAttributedText(_ secondaryAttributedText: NSAttributedString) -> Self {
        var me = self
        me.secondaryAttributedText = secondaryAttributedText
        return me
    }
    @discardableResult
    func secondaryTextProperties(_ secondaryTextProperties: UIListContentConfiguration.TextProperties) -> Self {
        var me = self
        me.secondaryTextProperties = secondaryTextProperties
        return me
    }
    @discardableResult
    func axesPreservingSuperviewLayoutMargins(_ axesPreservingSuperviewLayoutMargins: UIAxis) -> Self {
        var me = self
        me.axesPreservingSuperviewLayoutMargins = axesPreservingSuperviewLayoutMargins
        return me
    }
    @discardableResult
    func directionalLayoutMargins(_ directionalLayoutMargins: NSDirectionalEdgeInsets) -> Self {
        var me = self
        me.directionalLayoutMargins = directionalLayoutMargins
        return me
    }
    @discardableResult
    func prefersSideBySideTextAndSecondaryText(_ prefersSideBySideTextAndSecondaryText: Bool) -> Self {
        var me = self
        me.prefersSideBySideTextAndSecondaryText = prefersSideBySideTextAndSecondaryText
        return me
    }
    @discardableResult
    func imageToTextPadding(_ imageToTextPadding: CGFloat) -> Self {
        var me = self
        me.imageToTextPadding = imageToTextPadding
        return me
    }
    @discardableResult
    func textToSecondaryTextHorizontalPadding(_ textToSecondaryTextHorizontalPadding: CGFloat) -> Self {
        var me = self
        me.textToSecondaryTextHorizontalPadding = textToSecondaryTextHorizontalPadding
        return me
    }
    @discardableResult
    func textToSecondaryTextVerticalPadding(_ textToSecondaryTextVerticalPadding: CGFloat) -> Self {
        var me = self
        me.textToSecondaryTextVerticalPadding = textToSecondaryTextVerticalPadding
        return me
    }
}
