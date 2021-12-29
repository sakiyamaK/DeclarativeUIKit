//
//  ViewController.swift
//  DeclarativeUIKitDemo
//
//  Created by sakiyamaK on 2021/12/25.
//

import UIKit
import DeclarativeUIKit

final class RootViewController: UIViewController {
    
    enum ViewTag: Int {
        case simpleDemoButton = 1
        case collectionViewButton
        case githubSearch
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Root"
        
        let Button = {(title: String) -> UIButton in
            UIButton {
                guard let button = $0 as? UIButton else { return }
                button.setTitle(title, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
                button.contentEdgeInsets = .init(top: 10, left: 10, bottom: 10, right: 10)
                button.titleLabel?.setContentCompressionResistancePriority(.required, for: .horizontal)
            }
            .backgroundColor(.systemBlue)
            .cornerRadius(10)
        }
                
        self.declarate {
            UIScrollView.vertical {
                UIStackView.vertical {
                    UIView.spacer()
                    
                    Button("シンプルな例")
                        .imperative {
                            guard let button = $0 as? UIButton else { return }
                            button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
                        }
                        .tag(ViewTag.simpleDemoButton.rawValue)

                    UIView.spacer()

                    Button("CollectionView")
                        .imperative {
                            guard let button = $0 as? UIButton else { return }
                            button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
                        }
                        .tag(ViewTag.collectionViewButton.rawValue)

                    UIView.spacer()

                    Button("GithubSearch")
                        .imperative {
                            guard let button = $0 as? UIButton else { return }
                            button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
                        }
                        .tag(ViewTag.githubSearch.rawValue)

                    UIView.spacer()
                }
                .spacing(20)
                .distribution(.fillEqually)
                .alignment(.center)
            }
            .showsScrollIndicator(false)
        }
    }
}

@objc private extension RootViewController {
    func tapButton(_ sender: UIButton) {
        guard let viewTag = ViewTag(rawValue: sender.tag) else { return }
        switch viewTag {
        case .simpleDemoButton:
            let vc = SimpleViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .collectionViewButton:
            let vc = CollectionViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .githubSearch:
            let vc = GithubSearchCollectionViewController()
            let presenter = GithubSearchPresenter(output: vc)
            vc.inject(presenter: presenter)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


import SwiftUI

struct RootViewController_Wrapper: UIViewControllerRepresentable {
    typealias ViewController = RootViewController
    func makeUIViewController(context: Context) -> ViewController {
        let vc = ViewController()
        return vc
    }

    func updateUIViewController(_ vc: ViewController, context: Context) {
    }
}

struct RootViewController_Previews: PreviewProvider {
  static var previews: some View {
      Group {
          RootViewController_Wrapper()
      }
  }
}
