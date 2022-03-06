//
//  HotReloadViewController.swift
//  DeclarativeUIKitDemo
//
//  Created by sakiyamaK on 2022/03/06.
//

import UIKit
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
    
    override func loadView() {
        super.loadView()
        NotificationCenter.default.addInjectionObserver(self, selector: #selector(setupLayout), object: nil)
        setupLayout()
    }
    
    @objc private func setupLayout() {
        self.view.backgroundColor = .white
        self.declarative {
                UIStackView.horizontal {
                    UILabel("普通のラベル")
                        .backgroundColor(.red)
                    UILabel("普通のラベル")
                        .backgroundColor(.green)
                    UILabel("普通のラベル")
                        .textColor(.white)
                        .backgroundColor(.blue)
                }
                .spacing(10)
                .center()
        }     
    }
}
