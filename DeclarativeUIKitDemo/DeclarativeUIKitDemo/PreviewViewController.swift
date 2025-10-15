//
//  HotReloadViewController.swift
//  DeclarativeUIKitDemo
//
//  Created by sakiyamaK on 2022/03/06.
//

import UIKit
import DeclarativeUIKit

public final class PreviewViewController: UIViewController {

    private let scrollView = UIScrollView()

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.declarative(layoutGuides: .init(bottom: .keyboard)) {
            UIStackView {
                self.scrollView.vertical {
                    UIStackView(spacing: 8) {
                        (0...20).compactMap { _ in
                            UITextField().placeholder("textField").borderStyle(.roundedRect)
                        }
                    }
                    .margins(.init(horizontal: 8))
                }

                UIView.spacer()

                UIButton(configuration: .bordered().title("button").contentInsets(.init(vertical: 20)))
            }
        }
        .applyView {
            $0.backgroundColor(.systemBackground)
        }

//        NSLayoutConstraint.activate([
//            self.scrollView.bottomAnchor.constraint(lessThanOrEqualTo: self.view.keyboardLayoutGuide.topAnchor)
//        ])
    }
}

public extension UIScrollView {

    private func constraint(axis: NSLayoutConstraint.Axis = .vertical, layoutGuides: UIEdgeLayoutGuides, margin: UIEdgeInsets = .zero, view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)

        let height = view.heightAnchor.constraint(equalTo: self.frameLayoutGuide.heightAnchor, constant: -(margin.top + margin.bottom))
        let width = view.widthAnchor.constraint(equalTo: self.frameLayoutGuide.widthAnchor, constant: -(margin.left + margin.right))

        if axis == .vertical {
            height.priority = .init(rawValue: 1)
        } else {
            width.priority = .init(rawValue: 1)
        }

        let bottom = view.bottomAnchor.constraint(equalTo: self.keyboardLayoutGuide.topAnchor)

        NSLayoutConstraint.activate(
            [
                bottom,
                view.topAnchor.constraint(equalTo: self.contentLayoutGuide.topAnchor, constant: margin.top),
                view.leftAnchor.constraint(equalTo: self.contentLayoutGuide.leftAnchor, constant: margin.left),
                view.rightAnchor.constraint(equalTo: self.contentLayoutGuide.rightAnchor, constant: margin.right),
                view.bottomAnchor
                    .constraint(equalTo: self.contentLayoutGuide.bottomAnchor, constant: margin.bottom)
//                    .priority(.init(rawValue: 999))
                ,
                width,
                height
            ]
        )
    }

    convenience init(
        axis: NSLayoutConstraint.Axis = .vertical,
        layoutGuides: UIEdgeLayoutGuides,
        margin: UIEdgeInsets = .zero,
        _ builder: @escaping () -> UIView? = {() in nil }
    ) {
        self.init(frame: .zero)
        if let view = builder() {
            self.constraint(axis: axis, layoutGuides: layoutGuides, margin: margin, view: view)
        }
    }
}

#Preview {
    UITabBarController()
        .viewControllers(
            [
                UINavigationController(
                    rootViewController: PreviewViewController()
                )
            ]
        )

}

