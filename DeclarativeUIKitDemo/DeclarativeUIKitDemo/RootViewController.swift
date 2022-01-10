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
        case tablewViewButton
        case collectionViewButton
        case githubSearchButton
        case swiftuiTutorialButton
        case pathButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Root"
        
        let Button = {(title: String) -> UIButton in
            UIButton.imperative {
                let button = $0 as! UIButton
                button.contentEdgeInsets = .init(top: 10, left: 10, bottom: 10, right: 10)
                button.titleLabel?.setContentCompressionResistancePriority(.required, for: .horizontal)
            }
            .title(title)
            .font(UIFont.systemFont(ofSize: 30))
            .backgroundColor(.systemBlue)
            .cornerRadius(10)
        }
                
        self.declarative {
            UIScrollView {
                UIStackView {
                    UIView.spacer()
                    
                    Button("Path")
                        .add(target: self, action: #selector(tapButton), for: .touchUpInside)
                        .tag(ViewTag.pathButton.rawValue)
                        .minWidth(200)

                    UIView.spacer()

                    Button("シンプルな例")
                        .add(target: self, action: #selector(tapButton), for: .touchUpInside)
                        .tag(ViewTag.simpleDemoButton.rawValue)

                    UIView.spacer()

                    Button("TablewView")
                        .add(target: self, action: #selector(tapButton), for: .touchUpInside)
                        .tag(ViewTag.tablewViewButton.rawValue)

                    UIView.spacer()

                    Button("CollectionView")
                        .add(target: self, action: #selector(tapButton), for: .touchUpInside)
                        .tag(ViewTag.collectionViewButton.rawValue)

                    UIView.spacer()

                    Button("GithubSearch")
                        .add(target: self, action: #selector(tapButton), for: .touchUpInside)
                        .tag(ViewTag.githubSearchButton.rawValue)

                    UIView.spacer()

                    Button("SwiftUI Tutorial")
                        .add(target: self, action: #selector(tapButton), for: .touchUpInside)
                        .tag(ViewTag.swiftuiTutorialButton.rawValue)

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
        case .pathButton:
            let vc = PathViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .simpleDemoButton:
            let vc = SimpleViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .tablewViewButton:
            let vc = TableViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .collectionViewButton:
            let vc = CollectionViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .githubSearchButton:
            let vc = GithubSearchCollectionViewController()
            let presenter = GithubSearchPresenter(output: vc)
            vc.inject(presenter: presenter)
            self.navigationController?.pushViewController(vc, animated: true)
        case .swiftuiTutorialButton:
            let vc = LandmarkListViewController()
            vc.inject(landmarks: ModelData.landmarks, isOn: false)
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
