import WebKit

public extension WKWebViewConfiguration {

    @discardableResult
    func preferences(_ preferences: WKPreferences) -> Self {
        self.preferences = preferences
        return self
    }

    @discardableResult
    func preferences(_ builder: () -> WKPreferences) -> Self {
        self.preferences = builder()
        return self
    }

    @discardableResult
    func userContentController(_ userContentController: WKUserContentController) -> Self {
        self.userContentController = userContentController
        return self
    }

    @discardableResult
    func userContentController(_ builder: () -> WKUserContentController) -> Self {
        self.userContentController = builder()
        return self
    }

    @discardableResult
    func websiteDataStore(_ websiteDataStore: WKWebsiteDataStore) -> Self {
        self.websiteDataStore = websiteDataStore
        return self
    }

    @discardableResult
    func applicationNameForUserAgent(_ applicationName: String?) -> Self {
        self.applicationNameForUserAgent = applicationName
        return self
    }

    @discardableResult
    func allowsInlineMediaPlayback(_ allows: Bool) -> Self {
        self.allowsInlineMediaPlayback = allows
        return self
    }

    @discardableResult
    func mediaTypesRequiringUserActionForPlayback(_ types: WKAudiovisualMediaTypes) -> Self {
        self.mediaTypesRequiringUserActionForPlayback = types
        return self
    }

    @discardableResult
    func defaultWebpagePreferences(_ preferences: WKWebpagePreferences) -> Self {
        self.defaultWebpagePreferences = preferences
        return self
    }
    
    @discardableResult
    func processPool(_ processPool: WKProcessPool) -> Self {
        self.processPool = processPool
        return self
    }

    @discardableResult
    func suppressesIncrementalRendering(_ suppresses: Bool) -> Self {
        self.suppressesIncrementalRendering = suppresses
        return self
    }

    @discardableResult
    func allowsAirPlayForMediaPlayback(_ allows: Bool) -> Self {
        self.allowsAirPlayForMediaPlayback = allows
        return self
    }

    @available(iOS 14.5, *)
    @discardableResult
    func upgradeKnownHostsToHTTPS(_ upgrade: Bool) -> Self {
        self.upgradeKnownHostsToHTTPS = upgrade
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func limitsNavigationsToAppBoundDomains(_ limits: Bool) -> Self {
        self.limitsNavigationsToAppBoundDomains = limits
        return self
    }

    @available(iOS 17.0, *)
    @discardableResult
    func allowsInlinePredictions(_ allows: Bool) -> Self {
        self.allowsInlinePredictions = allows
        return self
    }

    @discardableResult
    func selectionGranularity(_ granularity: WKSelectionGranularity) -> Self {
        self.selectionGranularity = granularity
        return self
    }

    @discardableResult
    func allowsPictureInPictureMediaPlayback(_ allows: Bool) -> Self {
        self.allowsPictureInPictureMediaPlayback = allows
        return self
    }

    @discardableResult
    func dataDetectorTypes(_ types: WKDataDetectorTypes) -> Self {
        self.dataDetectorTypes = types
        return self
    }

    @discardableResult
    func ignoresViewportScaleLimits(_ ignores: Bool) -> Self {
        self.ignoresViewportScaleLimits = ignores
        return self
    }
}
