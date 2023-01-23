//
//  ViewController.swift
//  DeclarativeUIKitDemo
//
//  Created by sakiyamaK on 2021/12/25.
//

import UIKit
import DeclarativeUIKit

final class RootViewController: UIViewController {
        
    override func loadView() {
        super.loadView()

        self.view.backgroundColor = .white
        self.navigationItem.title = "Root"
        
        let Button = {(title: String) -> UIButton in
            UIButton().apply {
                $0.contentEdgeInsets = .init(top: 10, left: 10, bottom: 10, right: 10)
                $0.titleLabel?.setContentCompressionResistancePriority(.required, for: .horizontal)
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
                    
                    if true {
                        Button("ホットリロード")
                            .add(target: self, for: .touchUpInside, {_ in
                                let vc = HotReloadViewController()
                                self.navigationController?.pushViewController(vc, animated: true)
                            })
                        UIView.spacer()
                    }
                    
                    Button("レイアウトの基本")
                        .add(target: self, for: .touchUpInside, {_ in
                            let vc = SimpleViewController()
                            self.navigationController?.pushViewController(vc, animated: true)
                        })

                    UIView.spacer()

                    Button("基本的なコンポーネント")
                        .add(target: self, for: .touchUpInside, {_ in
                            let vc = Simple2ViewController()
                            self.navigationController?.pushViewController(vc, animated: true)
                        })

                    UIView.spacer()

                    Button("TablewView")
                        .add(target: self, for: .touchUpInside, {_ in
                            let vc = TableViewController()
                            self.navigationController?.pushViewController(vc, animated: true)
                        })

                    UIView.spacer()

                    Button("CollectionView")
                        .add(target: self, for: .touchUpInside, {_ in
                            let vc = CollectionViewController()
                            self.navigationController?.pushViewController(vc, animated: true)
                        })

                    UIView.spacer()

                    Button("Path")
                        .add(target: self, for: .touchUpInside, {_ in
                            let vc = PathViewController()
                            self.navigationController?.pushViewController(vc, animated: true)
                        })
                        .minWidth(200)

                    UIView.spacer()
                    
                    Button("UITabBarController")
                        .add(target: self, for: .touchUpInside, {_ in
                            let vc = UITabBarController.rootTabBarController()
                            self.navigationController?.pushViewController(vc, animated: true)
                        })

                    UIView.spacer()


                    Button("GithubSearch")
                        .add(target: self, for: .touchUpInside, {_ in
                            let vc = GithubSearchCollectionViewController()
                            let presenter = GithubSearchPresenter(output: vc)
                            vc.inject(presenter: presenter)
                            self.navigationController?.pushViewController(vc, animated: true)
                        })

                    UIView.spacer()

                    Button("SwiftUI Tutorial")
                        .add(target: self, for: .touchUpInside, {_ in
                            let vc = LandmarkListViewController()
                            vc.inject(landmarks: ModelData.landmarks, isOn: false)
                            self.navigationController?.pushViewController(vc, animated: true)
                        })

                    UIView.spacer()
                    
                    Button("MapView")
                        .add(target: self, for: .touchUpInside, {_ in
                            let vc = MapViewController()
                            self.navigationController?.pushViewController(vc, animated: true)
                        })

                    UIView.spacer()

//                    Button("tiktok")
//                        .add(target: self, for: .touchUpInside, {_ in
//                            let vc = TiktokHomeViewController()
//                            self.navigationController?.pushViewController(vc, animated: true)
//                        })
//
//                    UIView.spacer()
//
//                    Button("twitter")
//                        .add(target: self, for: .touchUpInside, {_ in
//                            let vc = TwitterHomeViewController()
//                            self.navigationController?.pushViewController(vc, animated: true)
//                        })
//
//                    UIView.spacer()
//
//                    Button("Flutter Tutorial")
//                        .add(target: self, for: .touchUpInside, {_ in
//                            let vc = FlutterTutorialViewController()
//                            self.navigationController?.pushViewController(vc, animated: true)
//                        })
//
//                    UIView.spacer()
                }
                .spacing(20)
                .distribution(.fillEqually)
                .alignment(.center)
            }
            .showsScrollIndicator(false)
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
