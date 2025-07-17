import WebKit

public extension WKPreferences {

    @discardableResult
    func minimumFontSize(_ size: CGFloat) -> Self {
        self.minimumFontSize = size
        return self
    }

    @discardableResult
    func javaScriptEnabled(_ enabled: Bool) -> Self {
        self.javaScriptEnabled = enabled
        return self
    }

    @discardableResult
    func javaScriptCanOpenWindowsAutomatically(_ canOpen: Bool) -> Self {
        self.javaScriptCanOpenWindowsAutomatically = canOpen
        return self
    }

    @discardableResult
    func isFraudulentWebsiteWarningEnabled(_ enabled: Bool) -> Self {
        self.isFraudulentWebsiteWarningEnabled = enabled
        return self
    }

    @available(iOS 14.5, *)
    @discardableResult
    func isTextInteractionEnabled(_ enabled: Bool) -> Self {
        self.isTextInteractionEnabled = enabled
        return self
    }

    @available(iOS 16.4, *)
    @discardableResult
    func shouldPrintBackgrounds(_ shouldPrint: Bool) -> Self {
        self.shouldPrintBackgrounds = shouldPrint
        return self
    }

    @available(iOS 15.4, *)
    @discardableResult
    func isSiteSpecificQuirksModeEnabled(_ enabled: Bool) -> Self {
        self.isSiteSpecificQuirksModeEnabled = enabled
        return self
    }

    @available(iOS 15.4, *)
    @discardableResult
    func isElementFullscreenEnabled(_ enabled: Bool) -> Self {
        self.isElementFullscreenEnabled = enabled
        return self
    }

    @available(iOS 17.0, *)
    @discardableResult
    func inactiveSchedulingPolicy(_ policy: WKPreferences.InactiveSchedulingPolicy) -> Self {
        self.inactiveSchedulingPolicy = policy
        return self
    }
}
