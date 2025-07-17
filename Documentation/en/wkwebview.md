# WKWebView

`WKWebView` provides declarative methods to configure its properties and behavior in a fluent style.

## Initialization

You can initialize `WKWebView` with a declarative configuration for `WKWebViewConfiguration`.

```swift
WKWebView {
    WKWebViewConfiguration()
        .preferences {
            WKPreferences()
                .javaScriptEnabled(true)
                .javaScriptCanOpenWindowsAutomatically(true)
        }
        .userContentController {
            WKUserContentController()
                .add(userScript: WKUserScript(source: "alert('Hello from JavaScript!');", injectionTime: .atDocumentEnd, forMainFrameOnly: true))
        }
}
```

## Methods

### Some default parameters

The following standard parameters can be written declaratively.

```swift
func navigationDelegate(_ delegate: WKNavigationDelegate?) -> Self
func uiDelegate(_ delegate: WKUIDelegate?) -> Self
func load(_ request: URLRequest, completion: ((WKNavigation?) -> Void)?) -> Self
func loadFileURL(_ url: URL, allowingReadAccessTo readAccessURL: URL, completion: ((WKNavigation?) -> Void)?) -> Self
func loadHTMLString(_ string: String, baseURL: URL?, completion: ((WKNavigation?) -> Void)?) -> Self
func load(_ data: Data, mimeType: String, characterEncodingName: String, baseURL: URL, completion: ((WKNavigation?) -> Void)?) -> Self
func go(to item: WKBackForwardListItem, completion: ((WKNavigation?) -> Void)?) -> Self
func goBack(completion: ((WKNavigation?) -> Void)?) -> Self
func goForward(completion: ((WKNavigation?) -> Void)?) -> Self
func reload(fromOrigin: Bool = false, completion: ((WKNavigation?) -> Void)?) -> Self
func stopLoading() -> Self
func allowsBackForwardNavigationGestures(_ allows: Bool) -> Self
func customUserAgent(_ userAgent: String?) -> Self
func allowsLinkPreview(_ allows: Bool) -> Self
func pageZoom(_ zoom: CGFloat) -> Self
func mediaType(_ type: String?) -> Self
func underPageBackgroundColor(_ color: UIColor?) -> Self
func isFindInteractionEnabled(_ enabled: Bool) -> Self
func isInspectable(_ inspectable: Bool) -> Self
func applyScrollView(_ apply: (UIScrollView) -> Void) -> Self
```

#### Sample

```swift
WKWebView {
    WKWebViewConfiguration()
        .preferences {
            WKPreferences()
                .javaScriptEnabled(true)
        }
}
.load(URLRequest(url: URL(string: "https://www.google.com")!))
.allowsBackForwardNavigationGestures(true)
.applyScrollView { scrollView in
    scrollView.showsVerticalScrollIndicator = false
    scrollView.bounces = false
}
```
