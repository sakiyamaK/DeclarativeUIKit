//
//  File.swift
//  
//
//  Created by sakiyamaK on 2023/11/03.
//

import UIKit

@available(iOS 15.0, *)
public extension UIButton.Configuration {
    @discardableResult
    func background(_ background: UIBackgroundConfiguration) -> Self {
        var _self = self
        _self.background = background
        return _self
    }

    @discardableResult
    func cornerStyle(_ cornerStyle: UIButton.Configuration.CornerStyle) -> Self {
        var _self = self
        _self.cornerStyle = cornerStyle
        return _self
    }

    @discardableResult
    func buttonSize(_ buttonSize: UIButton.Configuration.Size) -> Self {
        var _self = self
        _self.buttonSize = buttonSize
        return _self
    }

    @discardableResult
    func macIdiomStyle(_ macIdiomStyle: UIButton.Configuration.MacIdiomStyle) -> Self {
        var _self = self
        _self.macIdiomStyle = macIdiomStyle
        return _self
    }

    @discardableResult
    func baseForegroundColor(_ baseForegroundColor: UIColor?) -> Self {
        var _self = self
        _self.baseForegroundColor = baseForegroundColor
        return _self
    }

    @discardableResult
    func baseBackgroundColor(_ baseBackgroundColor: UIColor?) -> Self {
        var _self = self
        _self.baseBackgroundColor = baseBackgroundColor
        return _self
    }

    @discardableResult
    func image(_ image: UIImage?) -> Self {
        var _self = self
        _self.image = image
        return _self
    }

    @discardableResult
    func imageColorTransformer(_ imageColorTransformer: UIConfigurationColorTransformer?) -> Self {
        var _self = self
        _self.imageColorTransformer = imageColorTransformer
        return _self
    }

    @discardableResult
    func preferredSymbolConfigurationForImage(_ preferredSymbolConfigurationForImage: UIImage.SymbolConfiguration?) -> Self {
        var _self = self
        _self.preferredSymbolConfigurationForImage = preferredSymbolConfigurationForImage
        return _self
    }

    @discardableResult
    func showsActivityIndicator(_ showsActivityIndicator: Bool) -> Self {
        var _self = self
        _self.showsActivityIndicator = showsActivityIndicator
        return _self
    }

    @discardableResult
    func activityIndicatorColorTransformer(_ activityIndicatorColorTransformer: UIConfigurationColorTransformer?) -> Self {
        var _self = self
        _self.activityIndicatorColorTransformer = activityIndicatorColorTransformer
        return _self
    }

    @discardableResult
    func title(_ title: String?) -> Self {
        var _self = self
        _self.title = title
        return _self
    }

    @discardableResult
    func attributedTitle(_ attributedTitle: AttributedString?) -> Self {
        var _self = self
        _self.attributedTitle = attributedTitle
        return _self
    }

    @discardableResult
    func titleTextAttributesTransformer(_ titleTextAttributesTransformer: UIConfigurationTextAttributesTransformer?) -> Self {
        var _self = self
        _self.titleTextAttributesTransformer = titleTextAttributesTransformer
        return _self
    }

    @discardableResult
    func subtitle(_ subtitle: String?) -> Self {
        var _self = self
        _self.subtitle = subtitle
        return _self
    }

    @discardableResult
    func attributedSubtitle(_ attributedSubtitle: AttributedString?) -> Self {
        var _self = self
        _self.attributedSubtitle = attributedSubtitle
        return _self
    }

    @discardableResult
    func subtitleTextAttributesTransformer(_ subtitleTextAttributesTransformer: UIConfigurationTextAttributesTransformer?) -> Self {
        var _self = self
        _self.subtitleTextAttributesTransformer = subtitleTextAttributesTransformer
        return _self
    }

    @available(iOS 16.0, tvOS 16.0, *)
    @discardableResult
    func indicator(_ indicator: UIButton.Configuration.Indicator) -> Self {
        var _self = self
        _self.indicator = indicator
        return _self
    }

    @available(iOS 16.0, tvOS 16.0, *)
    @discardableResult
    func indicatorColorTransformer(_ indicatorColorTransformer: UIConfigurationColorTransformer?) -> Self {
        var _self = self
        _self.indicatorColorTransformer = indicatorColorTransformer
        return _self
    }

    @discardableResult
    func contentInsets(_ contentInsets: NSDirectionalEdgeInsets) -> Self {
        var _self = self
        _self.contentInsets = contentInsets
        return _self
    }

    @discardableResult
    func imagePlacement(_ imagePlacement: NSDirectionalRectEdge) -> Self {
        var _self = self
        _self.imagePlacement = imagePlacement
        return _self
    }

    @discardableResult
    func imagePadding(_ imagePadding: CGFloat) -> Self {
        var _self = self
        _self.imagePadding = imagePadding
        return _self
    }

    @discardableResult
    func titlePadding(_ titlePadding: CGFloat) -> Self {
        var _self = self
        _self.titlePadding = titlePadding
        return _self
    }

    @discardableResult
    func titleAlignment(_ titleAlignment: UIButton.Configuration.TitleAlignment) -> Self {
        var _self = self
        _self.titleAlignment = titleAlignment
        return _self
    }
}
