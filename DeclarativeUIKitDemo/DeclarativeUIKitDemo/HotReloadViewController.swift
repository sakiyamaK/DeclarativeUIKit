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
}

@objc private extension HotReloadViewController {
    func setupLayout() {
        self.view.backgroundColor = .white
        self.declarative {
            UIButton("タップしてね")
                .titleColor(.systemBlue)
                .add(target: self, for: .touchUpInside, {
                    #selector(tapButton)
                })
        }
    }
    
    func tapButton(_ button: UIButton) {
        
        
        
        self.present(
                        
            UIAlertController(preferredStyle: .actionSheet)
                .title("タイトルだよーーん")
                .message("メッセージ")
                .addActions {
                    
                    //OKボタン押した時
                    UIAlertAction(title: "OK", style: .default) { _ in
                        self.present(
                            UIAlertController(preferredStyle: .alert)
                                .title("OKだね")
                                .addAction {
                                    UIAlertAction(title: "閉じる", style: .default) { _ in }
                                }
                            , animated: true)
                    }
                                        
                    //NOボタン押した時
                    UIAlertAction(title: "NO", style: .default) { _ in
                        self.present(
                            UIAlertController(preferredStyle: .alert)
                                .title("NOだね")
                                .addAction {
                                    UIAlertAction(title: "閉じる", style: .default) { _ in }
                                }
                            , animated: true)
                    }
                    
                    //Cancelボタン押した時
                    UIAlertAction(title: "Cancel", style: .cancel) { _ in
                        print("Cancelをタップしたよ")
                    }
                }
            , animated: true)
        
        
        
    }
}
