
import UIKit
import WebKit
import DeclarativeUIKit

class WebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "WKWebView Example"

        self.applyView({
            $0.backgroundColor(.systemBackground)
        })
        .declarative {
            WKWebView {
                WKWebViewConfiguration()
                    .allowsInlineMediaPlayback(true)
                    .preferences(
                        WKPreferences()
                            .javaScriptCanOpenWindowsAutomatically(true)
                    )
            }
            .load(URLRequest(url: URL(string: "https://www.google.com")!))
            .allowsBackForwardNavigationGestures(true)
            .applyScrollView {
                $0.showsVerticalScrollIndicator(false)
            }
        }
    }
}
