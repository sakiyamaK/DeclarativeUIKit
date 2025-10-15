import WebKit

public extension WKPreferences {

    @discardableResult
    func minimumFontSize(_ size: CGFloat) -> Self {
        self.minimumFontSize = size
        return self
    }

    @available(iOS, deprecated: 14.0, message: "Use WKWebpagePreferences.allowsContentJavaScript to disable content JavaScript on a per-navigation basis.")
    @discardableResult
    func javaScriptEnabled(_ enabled: Bool) -> Self {
        // WKPreferences.javaScriptEnabled is deprecated on iOS 14+. Avoid touching it to prevent warnings.
        if #available(iOS 14.0, *) {
            // No-op: Configure per-navigation via WKWebpagePreferences on the WKWebView load request.
            return self
        } else {
            // Prior to iOS 14, this property controlled content JavaScript globally.
            self.javaScriptEnabled = enabled
            return self
        }
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
