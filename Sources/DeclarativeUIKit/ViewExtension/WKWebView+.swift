import WebKit

public extension WKWebView {
    convenience init(configuration: WKWebViewConfiguration) {
        self.init(frame: .zero, configuration: configuration)
    }
    
    convenience init(configurationBuilder: () -> WKWebViewConfiguration) {
        self.init(frame: .zero, configuration: configurationBuilder())
    }
}

// MARK: - Declarative Methods
public extension WKWebView {

    // MARK: Delegates

    @discardableResult
    func navigationDelegate(_ delegate: WKNavigationDelegate?) -> Self {
        self.navigationDelegate = delegate
        return self
    }

    @discardableResult
    func uiDelegate(_ delegate: WKUIDelegate?) -> Self {
        self.uiDelegate = delegate
        return self
    }

    // MARK: Loading Content

    @discardableResult
    func load(_ request: URLRequest, completion: ((WKNavigation?) -> Void)? = nil) -> Self {
        let navigation = self.load(request)
        completion?(navigation)
        return self
    }

    @discardableResult
    func loadFileURL(_ url: URL, allowingReadAccessTo readAccessURL: URL, completion: ((WKNavigation?) -> Void)? = nil) -> Self {
        let navigation = self.loadFileURL(url, allowingReadAccessTo: readAccessURL)
        completion?(navigation)
        return self
    }

    @discardableResult
    func loadHTMLString(_ string: String, baseURL: URL?, completion: ((WKNavigation?) -> Void)? = nil) -> Self {
        let navigation = self.loadHTMLString(string, baseURL: baseURL)
        completion?(navigation)
        return self
    }

    @discardableResult
    func load(_ data: Data, mimeType: String, characterEncodingName: String, baseURL: URL, completion: ((WKNavigation?) -> Void)? = nil) -> Self {
        let navigation = self.load(data, mimeType: mimeType, characterEncodingName: characterEncodingName, baseURL: baseURL)
        completion?(navigation)
        return self
    }

    // MARK: Navigation

    @discardableResult
    func go(to item: WKBackForwardListItem, completion: ((WKNavigation?) -> Void)? = nil) -> Self {
        let navigation = self.go(to: item)
        completion?(navigation)
        return self
    }

    @discardableResult
    func goBack(completion: ((WKNavigation?) -> Void)? = nil) -> Self {
        let navigation = self.goBack()
        completion?(navigation)
        return self
    }

    @discardableResult
    func goForward(completion: ((WKNavigation?) -> Void)? = nil) -> Self {
        let navigation = self.goForward()
        completion?(navigation)
        return self
    }

    @discardableResult
    func reload(fromOrigin: Bool = false, completion: ((WKNavigation?) -> Void)? = nil) -> Self {
        let navigation: WKNavigation?
        if fromOrigin {
            navigation = self.reloadFromOrigin()
        } else {
            navigation = self.reload()
        }
        completion?(navigation)
        return self
    }

    // MARK: Properties

    @discardableResult
    func allowsBackForwardNavigationGestures(_ allows: Bool) -> Self {
        self.allowsBackForwardNavigationGestures = allows
        return self
    }

    @discardableResult
    func customUserAgent(_ userAgent: String?) -> Self {
        self.customUserAgent = userAgent
        return self
    }

    @discardableResult
    func allowsLinkPreview(_ allows: Bool) -> Self {
        self.allowsLinkPreview = allows
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func pageZoom(_ zoom: CGFloat) -> Self {
        self.pageZoom = zoom
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func mediaType(_ type: String?) -> Self {
        self.mediaType = type
        return self
    }

    @available(iOS 15.0, *)
    @discardableResult
    func underPageBackgroundColor(_ color: UIColor?) -> Self {
        self.underPageBackgroundColor = color
        return self
    }

    @available(iOS 16.0, *)
    @discardableResult
    func isFindInteractionEnabled(_ enabled: Bool) -> Self {
        self.isFindInteractionEnabled = enabled
        return self
    }

    @available(iOS 16.4, *)
    @discardableResult
    func isInspectable(_ inspectable: Bool) -> Self {
        self.isInspectable = inspectable
        return self
    }

    // MARK: ScrollView

    @discardableResult
    func applyScrollView(_ apply: (UIScrollView) -> Void) -> Self {
        apply(self.scrollView)
        return self
    }
}
