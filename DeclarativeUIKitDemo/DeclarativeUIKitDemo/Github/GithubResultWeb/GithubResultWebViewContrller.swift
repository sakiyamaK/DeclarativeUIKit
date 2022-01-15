import UIKit
import WebKit
import DeclarativeUIKit

final class GithubSearchResultViewController: UIViewController {
    
    private weak var webView: WKWebView!
    private weak var activityIndicatorStack: UIStackView!
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
                WKWebView.imperative {
                    let webView = $0 as! WKWebView
                    webView.uiDelegate = self
                    webView.navigationDelegate = self
                }
                .assign(to: &webView)
                .isHidden(true)
                
                UIStackView.vertical {
                    UIView.spacer().height(100)
                    UIActivityIndicatorView.imperative {
                        let indicator = $0 as! UIActivityIndicatorView
                        indicator.startAnimating()
                    }
                    .assign(to: &activityIndicator)
                    UIView.spacer()
                }
                .assign(to: &activityIndicatorStack)
            }
        }
        
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
        self.activityIndicatorStack.isHidden = !isLoading
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

private struct ViewController_Wrapper: UIViewControllerRepresentable {
    typealias ViewController = GithubSearchResultViewController
    
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
    
    func makeUIViewController(context: Context) -> ViewController {
        let vc = ViewController()
        let presenter = GithubResultWebPresenterMock(output: vc)
        vc.inject(presenter: presenter)
        return vc
    }
    
    func updateUIViewController(_ vc: ViewController, context: Context) {
    }
}

struct GithubSearchResultViewController_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewController_Wrapper()
        }
    }
}
