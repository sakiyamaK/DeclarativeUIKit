import UIKit
import WebKit
import DeclarativeUIKit

final class GithubSearchResultViewController: UIViewController {
    
    private weak var webView: WKWebView!
    private weak var activityIndicatorContianerView: UIView!
    private weak var activityIndicator: UIActivityIndicatorView!
    
    private var presenter: GithubResultWebPresenterInput!
    func inject(presenter: GithubResultWebPresenterInput) {
        self.presenter = presenter
    }
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = .white
        
        self.declarative {
            UIStackView.vertical {
                WKWebView().apply {
                    $0.uiDelegate = self
                    $0.navigationDelegate = self
                }
                .assign(to: &self.webView)
                .isHidden(true)
                
                UIActivityIndicatorView(assign: &self.activityIndicator)
                    .apply {
                        $0.startAnimating()
                    }
                    .center()
                    .offset(y: -100)
                    .assign(to: &self.activityIndicatorContianerView)
                    .isHidden(true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

private extension GithubSearchResultViewController {
    func update(isLoading: Bool) {
        self.webView.isHidden = isLoading
        self.activityIndicator.isHidden = !isLoading
        if isLoading {
            self.activityIndicator.startAnimating()
        } else {
            self.activityIndicator.stopAnimating()
        }
        self.activityIndicatorContianerView.isHidden = !isLoading
    }
}

extension GithubSearchResultViewController: GithubResultWebPresenterOutput {
    func load(request: URLRequest) {
        webView.load(request)
    }
}

extension GithubSearchResultViewController: WKUIDelegate {
}

extension GithubSearchResultViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.update(isLoading: true)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.update(isLoading: false)
    }
}

import SwiftUI

#Preview {
    
    final class GithubResultWebPresenterMock: GithubResultWebPresenterInput {
        
        private weak var output: GithubResultWebPresenterOutput!
        
        init(output: GithubResultWebPresenterOutput) {
            self.output = output
        }
        
        func viewDidLoad() {
            guard let url = URL(string: "https://github.com/sakiyamaK/DeclarativeUIKit") else { return }
            output.load(request: URLRequest(url: url))
        }
    }

    let vc = GithubSearchResultViewController()
    let presenter = GithubResultWebPresenterMock(output: vc)
    vc.inject(presenter: presenter)
    return vc
}
