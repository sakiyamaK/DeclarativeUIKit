//
//  File.swift
//  
//
//  Created by sakiyamaK on 2023/11/03.
//

import UIKit

@available(iOS 15.0, *)
public extension UIButton.Configuration {
    func background(_ background: UIBackgroundConfiguration) -> Self {
        var _self = self
        _self.background = background
        return _self
    }

    func cornerStyle(_ cornerStyle: UIButton.Configuration.CornerStyle) -> Self {
        var _self = self
        _self.cornerStyle = cornerStyle
        return _self
    }

    func buttonSize(_ buttonSize: UIButton.Configuration.Size) -> Self {
        var _self = self
        _self.buttonSize = buttonSize
        return _self
    }

    func macIdiomStyle(_ macIdiomStyle: UIButton.Configuration.MacIdiomStyle) -> Self {
        var _self = self
        _self.macIdiomStyle = macIdiomStyle
        return _self
    }

    func baseForegroundColor(_ baseForegroundColor: UIColor?) -> Self {
        var _self = self
        _self.baseForegroundColor = baseForegroundColor
        return _self
    }

    func baseBackgroundColor(_ baseBackgroundColor: UIColor?) -> Self {
        var _self = self
        _self.baseBackgroundColor = baseBackgroundColor
        return _self
    }

    func image(_ image: UIImage?) -> Self {
        var _self = self
        _self.image = image
        return _self
    }

    func imageColorTransformer(_ imageColorTransformer: UIConfigurationColorTransformer?) -> Self {
        var _self = self
        _self.imageColorTransformer = imageColorTransformer
        return _self
    }

    func preferredSymbolConfigurationForImage(_ preferredSymbolConfigurationForImage: UIImage.SymbolConfiguration?) -> Self {
        var _self = self
        _self.preferredSymbolConfigurationForImage = preferredSymbolConfigurationForImage
        return _self
    }

    func showsActivityIndicator(_ showsActivityIndicator: Bool) -> Self {
        var _self = self
        _self.showsActivityIndicator = showsActivityIndicator
        return _self
    }

    func activityIndicatorColorTransformer(_ activityIndicatorColorTransformer: UIConfigurationColorTransformer?) -> Self {
        var _self = self
        _self.activityIndicatorColorTransformer = activityIndicatorColorTransformer
        return _self
    }

    func title(_ title: String?) -> Self {
        var _self = self
        _self.title = title
        return _self
    }

    func attributedTitle(_ attributedTitle: AttributedString?) -> Self {
        var _self = self
        _self.attributedTitle = attributedTitle
        return _self
    }

    func titleTextAttributesTransformer(_ titleTextAttributesTransformer: UIConfigurationTextAttributesTransformer?) -> Self {
        var _self = self
        _self.titleTextAttributesTransformer = titleTextAttributesTransformer
        return _self
    }

    func subtitle(_ subtitle: String?) -> Self {
        var _self = self
        _self.subtitle = subtitle
        return _self
    }

    func attributedSubtitle(_ attributedSubtitle: AttributedString?) -> Self {
        var _self = self
        _self.attributedSubtitle = attributedSubtitle
        return _self
    }

    func subtitleTextAttributesTransformer(_ subtitleTextAttributesTransformer: UIConfigurationTextAttributesTransformer?) -> Self {
        var _self = self
        _self.subtitleTextAttributesTransformer = subtitleTextAttributesTransformer
        return _self
    }

    @available(iOS 16.0, tvOS 16.0, *)
    func indicator(_ indicator: UIButton.Configuration.Indicator) -> Self {
        var _self = self
        _self.indicator = indicator
        return _self
    }

    @available(iOS 16.0, tvOS 16.0, *)
    func indicatorColorTransformer(_ indicatorColorTransformer: UIConfigurationColorTransformer?) -> Self {
        var _self = self
        _self.indicatorColorTransformer = indicatorColorTransformer
        return _self
    }

    func contentInsets(_ contentInsets: NSDirectionalEdgeInsets) -> Self {
        var _self = self
        _self.contentInsets = contentInsets
        return _self
    }

    func imagePlacement(_ imagePlacement: NSDirectionalRectEdge) -> Self {
        var _self = self
        _self.imagePlacement = imagePlacement
        return _self
    }

    func imagePadding(_ imagePadding: CGFloat) -> Self {
        var _self = self
        _self.imagePadding = imagePadding
        return _self
    }

    func titlePadding(_ titlePadding: CGFloat) -> Self {
        var _self = self
        _self.titlePadding = titlePadding
        return _self
    }

    func titleAlignment(_ titleAlignment: UIButton.Configuration.TitleAlignment) -> Self {
        var _self = self
        _self.titleAlignment = titleAlignment
        return _self
    }
}
