//
//  HotReloadViewController.swift
//  DeclarativeUIKitDemo
//
//  Created by sakiyamaK on 2022/03/06.
//

import UIKit
import MapKit
import DeclarativeUIKit

extension Notification.Name {
    static let injection = Notification.Name("INJECTION_BUNDLE_NOTIFICATION")
}

extension NotificationCenter {
    func addInjectionObserver(_ observer: Any, selector: Selector, object: Any?) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: .injection, object: object)
    }
}

final class HotReloadViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let stackView = UIStackView()

    override func loadView() {
        super.loadView()
        NotificationCenter.default.addInjectionObserver(self, selector: #selector(setupLayout), object: nil)
        setupLayout()
    }
}

@objc private extension HotReloadViewController {
    func setupLayout() {

        self.applyView {
            $0.backgroundColor(.white)
        }.declarative {
            self.scrollView.horizontal {
                self.stackView.horizontal {
                    UILabel("hoge")
                        .height(100)
                    UILabel("hoge")
                    UILabel("hoge")
                    UILabel("hoge")
                    UILabel("hoge")
                    UILabel("hoge")
                    UILabel("hoge")
                    UILabel("hoge")
                    UILabel("hoge")
                    UILabel("hoge")
                    UILabel("hoge")
                    UILabel("hoge")
                    UILabel("hoge")
                    UILabel("hoge")
                    UILabel("hoge")
                    UILabel("hoge")
                    UILabel("hoge")
                    UILabel("hoge")
                }
                .distribution(.fillEqually)
            }
        }
    }
}


final class HotReload2ViewController: UIViewController {

    override func loadView() {
        super.loadView()

        guard #available(iOS 15.0, *) else {
            fatalError()
        }

        self.applyView {
            $0.backgroundColor(.white)
        }.declarative {
            UIStackView {
                UILabel("hoge")
                    .backgroundColor(.green)
                UILabel("hoge")
                    .backgroundColor(.red)
                UITextView("hoge")
                    .isScrollEnabled(false)
                    .backgroundColor(.yellow)
                    .contentPriorities(.init(hugging: .init(999)))
            }
            .isLayoutMarginsRelativeArrangement(true)
            .margins(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
    }
}

#Preview {
    UITabBarController()
        .viewControllers([HotReloadViewController(), HotReload2ViewController()])

}

