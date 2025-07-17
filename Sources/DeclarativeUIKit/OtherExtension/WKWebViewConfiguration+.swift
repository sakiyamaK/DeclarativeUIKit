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

/*
 @available(iOS 8.0, *)
 @MainActor open class WKWebViewConfiguration : NSObject, NSSecureCoding, NSCopying {

     /** @abstract The process pool from which to obtain the view's web content
      process.
      @discussion When a web view is initialized, a new web content process
      will be created for it from the specified pool, or an existing process in
      that pool will be used.
     */
     open var processPool: WKProcessPool

     /** @abstract The preference settings to be used by the web view.
     */
     open var preferences: WKPreferences

     /** @abstract The user content controller to associate with the web view.
     */
     open var userContentController: WKUserContentController

     /** @abstract The website data store to be used by the web view.
      */
     @available(iOS 9.0, *)
     open var websiteDataStore: WKWebsiteDataStore

     /** @abstract A Boolean value indicating whether the web view suppresses
      content rendering until it is fully loaded into memory.
      @discussion The default value is NO.
      */
     open var suppressesIncrementalRendering: Bool

     /** @abstract The name of the application as used in the user agent string.
     */
     @available(iOS 9.0, *)
     open var applicationNameForUserAgent: String?

     /** @abstract A Boolean value indicating whether AirPlay is allowed.
      @discussion The default value is YES.
      */
     @available(iOS 9.0, *)
     open var allowsAirPlayForMediaPlayback: Bool

     /** @abstract A Boolean value indicating whether HTTP requests to servers known to support HTTPS should be automatically upgraded to HTTPS requests.
      @discussion The default value is YES.
      */
     @available(iOS 14.5, *)
     open var upgradeKnownHostsToHTTPS: Bool

     @available(iOS 10.0, *)
     open var mediaTypesRequiringUserActionForPlayback: WKAudiovisualMediaTypes

     /** @abstract The set of default webpage preferences to use when loading and rendering content.
      @discussion These default webpage preferences are additionally passed to the navigation delegate
      in -webView:decidePolicyForNavigationAction:preferences:decisionHandler:.
      */
     @available(iOS 13.0, *)
     @NSCopying open var defaultWebpagePreferences: WKWebpagePreferences!

     @available(iOS 14.0, *)
     open var limitsNavigationsToAppBoundDomains: Bool

     /** @abstract A Boolean value indicating whether inline predictions are allowed.
     @discussion The default value is `NO`. If false, inline predictions
     are disabled regardless of the system setting. If true, they are enabled based
     on the system setting.
     */
     @available(iOS 17.0, *)
     open var allowsInlinePredictions: Bool

     /** @abstract A Boolean value indicating whether HTML5 videos play inline
      (YES) or use the native full-screen controller (NO).
      @discussion The default value is NO.
      */
     open var allowsInlineMediaPlayback: Bool

     /** @abstract The level of granularity with which the user can interactively
      select content in the web view.
      @discussion Possible values are described in WKSelectionGranularity.
      The default value is WKSelectionGranularityDynamic.
      */
     open var selectionGranularity: WKSelectionGranularity

     /** @abstract A Boolean value indicating whether HTML5 videos may play
      picture-in-picture.
      @discussion The default value is YES.
      */
     @available(iOS 9.0, *)
     open var allowsPictureInPictureMediaPlayback: Bool

     /** @abstract An enum value indicating the type of data detection desired.
      @discussion The default value is WKDataDetectorTypeNone.
      An example of how this property may affect the content loaded in the WKWebView is that content like
      'Visit apple.com on July 4th or call 1 800 555-5545' will be transformed to add links around 'apple.com', 'July 4th' and '1 800 555-5545'
      if the dataDetectorTypes property is set to WKDataDetectorTypePhoneNumber | WKDataDetectorTypeLink | WKDataDetectorTypeCalendarEvent.

      */
     @available(iOS 10.0, *)
     open var dataDetectorTypes: WKDataDetectorTypes

     /** @abstract A Boolean value indicating whether the WKWebView should always allow scaling of the web page, regardless of author intent.
      @discussion This will override the user-scalable property.
      The default value is NO.
      */
     @available(iOS 10.0, *)
     open var ignoresViewportScaleLimits: Bool

     @available(iOS 11.0, *)
     open func setURLSchemeHandler(_ urlSchemeHandler: (any WKURLSchemeHandler)?, forURLScheme urlScheme: String)

     @available(iOS 11.0, *)
     open func urlSchemeHandler(forURLScheme urlScheme: String) -> (any WKURLSchemeHandler)?

     /** @abstract A Boolean value indicating whether insertion of adaptive image glyphs is allowed.
         @discussion The default value is `NO`. If `NO`, adaptive image glyphs are inserted as regular
         images. If `YES`, they are inserted with the full adaptive sizing behavior.
         */
     @available(iOS 18.0, *)
     open var supportsAdaptiveImageGlyph: Bool

     /** @abstract The preferred behavior of Writing Tools.
         @discussion The default behavior is equivalent to `UIWritingToolsBehaviorLimited`.
         */
     @available(iOS 18.0, *)
     open var writingToolsBehavior: UIWritingToolsBehavior
 }

 extension WKWebViewConfiguration {

     @available(iOS, introduced: 8.0, deprecated: 9.0)
     open var mediaPlaybackRequiresUserAction: Bool

     @available(iOS, introduced: 8.0, deprecated: 9.0)
     open var mediaPlaybackAllowsAirPlay: Bool

     @available(iOS, introduced: 9.0, deprecated: 10.0)
     open var requiresUserActionForMediaPlayback: Bool
 }


 */