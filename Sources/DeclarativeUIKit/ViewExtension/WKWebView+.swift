import UIKit
import WebKit

//MARK: - init
public extension WKWebView {
    convenience init(configuration: WKWebViewConfiguration) {
        self.init(frame: .zero, configuration: configuration)
    }
}

//MARK: - Declarative method
public extension WKWebView {
    @discardableResult
    func navigationDelegate(_ navigationDelegate: WKNavigationDelegate) -> Self {
        self.navigationDelegate = navigationDelegate
        return self
    }

    @discardableResult
    func uiDelegate(_ uiDelegate: WKUIDelegate?) -> Self {
        self.uiDelegate = uiDelegate
        return self
    }

    @discardableResult
    func allowsBackForwardNavigationGestures(_ allowsBackForwardNavigationGestures: Bool) -> Self {
        self.allowsBackForwardNavigationGestures = allowsBackForwardNavigationGestures
        return self
    }

    @discardableResult
    func allowsLinkPreview(_ allowsLinkPreview: Bool) -> Self {
        self.allowsLinkPreview = allowsLinkPreview
        return self
    }

    @discardableResult
    func customUserAgent(_ customUserAgent: String?) -> Self {
        self.customUserAgent = customUserAgent
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    func pageZoom(_ pageZoom: CGFloat) -> Self {
        self.pageZoom = pageZoom
        return self
    }
}
