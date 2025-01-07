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
    
    private weak var cardView: UIView!
    
    override func loadView() {
        super.loadView()
        NotificationCenter.default.addInjectionObserver(self, selector: #selector(setupLayout), object: nil)
        setupLayout()
    }
    
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        super.touchesBegan(touches, with: event)
    //        let touche = touches.first!
    //        let point = shadowPoint(from: touche.location(in: cardView))
    //        cardView.shadow(color: .black, radius: 10, x: point.x, y: point.y)
    //    }
    //
    //    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        super.touchesCancelled(touches, with: event)
    //        cardView.shadow(color: .black, radius: 10, x: 0, y: 10)
    //    }
    //
    //    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        super.touchesEnded(touches, with: event)
    //        cardView.shadow(color: .black, radius: 10, x: 0, y: 10)
    //    }
    //
    //    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        super.touchesMoved(touches, with: event)
    //        let touche = touches.first!
    //        let point = shadowPoint(from: touche.location(in: cardView))
    //        cardView.shadow(color: .black, radius: 10, x: point.x, y: point.y)
    //    }
    
    private func shadowPoint(from point: CGPoint) -> CGPoint {
        let x = (point.x - 250/2)/10
        let y = (point.y - 200/2)/10 + 10
        return .init(x: x, y: y)
    }
}

@objc private extension HotReloadViewController {
    func setupLayout() {
        guard #available(iOS 15.0, *) else {
            fatalError()
        }
        
        self.applyView {
            $0.backgroundColor(.white)
        }.declarative {
            UIButton("モーダル出て")
                .titleColor(.blue)
                .add(target: self, for: .touchUpInside) { _ in
                    UIViewController()
                        .applyView {
                            $0.backgroundColor(.white)
                        }
                        .declarative {
                            UIScrollView.vertical {
                                UIStackView.vertical {
                                    (0...50).compactMap { idx in
                                        UILabel("\(idx)でーす")
                                            .textAlignment(.center)
                                            .contentPriorities(.init(vertical: .required))
                                            .customSpacing(8)
                                    }
                                }
                                .padding(insets: .init(vertical: 30))
                            }
                        }
                        .applySheetPresentationController {
                            $0.detents([.large(), .medium()])
                                .preferredCornerRadius(16)
                                .prefersGrabberVisible(true)
                                .prefersScrollingExpandsWhenScrolledToEdge(false)
                                .largestUndimmedDetentIdentifier(.large)
                        }
                        .present(from: self, animated: true)
                }
                .center()
        }
    }
}

#Preview {
    HotReloadViewController()
}

