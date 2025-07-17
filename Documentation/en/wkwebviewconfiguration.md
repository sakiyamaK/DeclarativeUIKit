# WKWebViewConfiguration

`WKWebViewConfiguration` provides declarative methods to configure the behavior of a `WKWebView`.

## Methods

### Some default parameters

The following standard parameters can be written declaratively.

```swift
func preferences(_ preferences: WKPreferences) -> Self
func preferences(_ builder: () -> WKPreferences) -> Self
func userContentController(_ userContentController: WKUserContentController) -> Self
func userContentController(_ builder: () -> WKUserContentController) -> Self
func websiteDataStore(_ websiteDataStore: WKWebsiteDataStore) -> Self
func applicationNameForUserAgent(_ applicationName: String?) -> Self
func allowsInlineMediaPlayback(_ allows: Bool) -> Self
func mediaTypesRequiringUserActionForPlayback(_ types: WKAudiovisualMediaTypes) -> Self
func defaultWebpagePreferences(_ preferences: WKWebpagePreferences) -> Self
func processPool(_ processPool: WKProcessPool) -> Self
func suppressesIncrementalRendering(_ suppresses: Bool) -> Self
func allowsAirPlayForMediaPlayback(_ allows: Bool) -> Self
func upgradeKnownHostsToHTTPS(_ upgrade: Bool) -> Self
func limitsNavigationsToAppBoundDomains(_ limits: Bool) -> Self
func allowsInlinePredictions(_ allows: Bool) -> Self
func selectionGranularity(_ granularity: WKSelectionGranularity) -> Self
func allowsPictureInPictureMediaPlayback(_ allows: Bool) -> Self
func dataDetectorTypes(_ types: WKDataDetectorTypes) -> Self
func ignoresViewportScaleLimits(_ ignores: Bool) -> Self
```

#### Sample

```swift
WKWebViewConfiguration()
    .preferences {
        WKPreferences()
            .javaScriptEnabled(true)
            .minimumFontSize(12)
    }
    .userContentController {
        WKUserContentController()
            .add(userScript: WKUserScript(source: "alert('Hello');", injectionTime: .atDocumentEnd, forMainFrameOnly: true))
    }
    .websiteDataStore(.default())
```