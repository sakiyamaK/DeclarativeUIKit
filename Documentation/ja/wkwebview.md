# WKWebView

`WKWebView`は、そのプロパティと動作を流れるようなスタイルで設定するための宣言的なメソッドを提供します。

## 初期化

`WKWebViewConfiguration`の宣言的な設定で`WKWebView`を初期化できます。

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

## メソッド

### 標準パラメータ

以下の標準パラメータは宣言的に記述できます。

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

#### サンプル

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