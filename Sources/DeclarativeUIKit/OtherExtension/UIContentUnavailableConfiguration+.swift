import UIKit

@available(iOS 17.0, *)
public extension UIContentUnavailableConfiguration {

    func text(_ text: String?) -> Self {
        var config = self
        config.text = text
        return config
    }

    func text(_ attributedText: NSAttributedString?) -> Self {
        var config = self
        config.attributedText = attributedText
        return config
    }

    func attributedText(_ attributedText: NSAttributedString?) -> Self {
        var config = self
        config.attributedText = attributedText
        return config
    }

    func textProperties(_ textProperties: UIContentUnavailableConfiguration.TextProperties) -> Self {
        var config = self
        config.textProperties = textProperties
        return config
    }


    func secondaryText(_ secondaryText: String?) -> Self {
        var config = self
        config.secondaryText = secondaryText
        return config
    }

    func secondaryText(_ secondaryAttributedText: NSAttributedString?) -> Self {
        var config = self
        config.secondaryAttributedText = secondaryAttributedText
        return config
    }

    func secondaryAttributedText(_ secondaryAttributedText: NSAttributedString?) -> Self {
        var config = self
        config.secondaryAttributedText = secondaryAttributedText
        return config
    }

    func secondaryTextProperties(_ secondaryTextProperties: UIContentUnavailableConfiguration.TextProperties) -> Self {
        var config = self
        config.secondaryTextProperties = secondaryTextProperties
        return config
    }

    func image(_ image: UIImage?) -> Self {
        var config = self
        config.image = image
        return config
    }

    func imageProperties(_ imageProperties: UIContentUnavailableConfiguration.ImageProperties) -> Self {
        var config = self
        config.imageProperties = imageProperties
        return config
    }

    func button(_ buttonConfiguration: UIButton.Configuration, primaryAction: UIAction? = nil) -> Self {
        var config = self
        config.button = buttonConfiguration
        config.buttonProperties.primaryAction = primaryAction
        return config
    }

    func button(_ buttonConfiguration: UIButton.Configuration, primaryActionHandler: @escaping UIActionHandler) -> Self {
        var config = self
        config.button = buttonConfiguration
        config.buttonProperties.primaryAction = UIAction(handler: primaryActionHandler)
        return config
    }

    func buttonProperties(_ buttonProperties: UIContentUnavailableConfiguration.ButtonProperties) -> Self {
        var config = self
        config.buttonProperties = buttonProperties
        return config
    }

    func secondaryButton(_ secondaryButtonConfiguration: UIButton.Configuration, primaryAction: UIAction? = nil) -> Self {
        var config = self
        config.secondaryButton = secondaryButtonConfiguration
        config.secondaryButtonProperties.primaryAction = primaryAction
        return config
    }

    func secondaryButton(_ secondaryButtonConfiguration: UIButton.Configuration, primaryActionHandler: @escaping UIActionHandler) -> Self {
        var config = self
        config.secondaryButton = secondaryButtonConfiguration
        config.secondaryButtonProperties.primaryAction = UIAction(handler: primaryActionHandler)
        return config
    }

    func secondaryButtonProperties(_ secondaryButtonProperties: UIContentUnavailableConfiguration.ButtonProperties) -> Self {
        var config = self
        config.secondaryButtonProperties = secondaryButtonProperties
        return config
    }


    func background(_ background: UIBackgroundConfiguration) -> Self {
        var config = self
        config.background = background
        return config
    }

    func alignment(_ alignment: UIContentUnavailableConfiguration.Alignment) -> Self {
        var config = self
        config.alignment = alignment
        return config
    }

    func axesPreservingSuperviewLayoutMargins(_ axes: UIAxis) -> Self {
        var config = self
        config.axesPreservingSuperviewLayoutMargins = axes
        return config
    }

    func directionalLayoutMargins(_ directionalLayoutMargins: NSDirectionalEdgeInsets) -> Self {
        var config = self
        config.directionalLayoutMargins = directionalLayoutMargins
        return config
    }

    func imageToTextPadding(_ padding: CGFloat) -> Self {
        var config = self
        config.imageToTextPadding = padding
        return config
    }

    func textToSecondaryTextPadding(_ padding: CGFloat) -> Self {
        var config = self
        config.textToSecondaryTextPadding = padding
        return config
    }

    func textToButtonPadding(_ padding: CGFloat) -> Self {
        var config = self
        config.textToButtonPadding = padding
        return config
    }

    func buttonToSecondaryButtonPadding(_ padding: CGFloat) -> Self {
        var config = self
        config.buttonToSecondaryButtonPadding = padding
        return config
    }
}
