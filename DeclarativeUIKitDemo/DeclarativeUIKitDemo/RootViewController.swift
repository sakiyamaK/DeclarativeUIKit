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

        let Button = {(title: String) -> UIButton in
            UIButton(configurationBuilder: {
                UIButton.Configuration.filled()
                    .baseForegroundColor(.white)
                    .baseBackgroundColor(.systemBlue)
                    .cornerStyle(.capsule)
                    .attributedTitle(
                        AttributedString(
                            title,
                            attributes: .init([
                                .font: UIFont.systemFont(ofSize: 20)
                            ]
                            )
                        )
                    )
            }, primaryAction: nil)
        }
                
        self
            .resetDeclarativeUIKitLayout()
            .applyView({ $0.backgroundColor = .white })
            .applyNavigationItem({ $0.title = "Root" })
            .declarative {
            UIScrollView {
                UIStackView {
                    UIView.spacer()
                    
                    if false {
                        Button("ホットリロード")
                            .addAction(.touchUpInside, handler: {[weak self] _ in
                                let vc = HotReloadViewController()
                                self!.navigationController?.pushViewController(vc, animated: true)
                            })
                    }
                    
                    Button("レイアウトの基本")
                        .addAction(.touchUpInside, handler: {[weak self] _ in
                            let vc = SimpleViewController()
                            self!.navigationController?.pushViewController(vc, animated: true)
                        })

                    Button("基本的なコンポーネント1")
                        .addAction(.touchUpInside, handler: {[weak self] _ in
                            let vc = Simple2ViewController()
                            self!.navigationController?.pushViewController(vc, animated: true)
                        })

                    Button("基本的なコンポーネン2")
                        .addAction(.touchUpInside, handler: {[weak self] _ in
                            let vc = Simple3ViewController()
                            self!.navigationController?.pushViewController(vc, animated: true)
                        })

                    Button("TablewView")
                        .addAction(.touchUpInside, handler: {[weak self] _ in
                            let vc = TableViewController()
                            self!.navigationController?.pushViewController(vc, animated: true)
                        })

                    Button("CollectionView")
                        .addAction(.touchUpInside, handler: {[weak self] _ in
                            let vc = CollectionViewController()
                            self!.navigationController?.pushViewController(vc, animated: true)
                        })

                    Button("Path")
                        .addAction(.touchUpInside, handler: {[weak self] _ in
                            let vc = PathViewController()
                            self!.navigationController?.pushViewController(vc, animated: true)
                        })
                        .minWidth(200)
                    
                    Button("UITabBarController")
                        .addAction(.touchUpInside, handler: {[weak self] _ in
                            let vc = UITabBarController.rootTabBarController()
                            self!.navigationController?.pushViewController(vc, animated: true)
                        })

                    Button("GithubSearch")
                        .addAction(.touchUpInside, handler: {[weak self] _ in
                            let vc = GithubSearchCollectionViewController()
                            let presenter = GithubSearchPresenter(output: vc)
                            vc.inject(presenter: presenter)
                            self!.navigationController?.pushViewController(vc, animated: true)
                        })

                    Button("SwiftUI Tutorial")
                        .addAction(.touchUpInside, handler: {[weak self] _ in
                            let vc = LandmarkListViewController()
                            vc.inject(landmarks: ModelData.landmarks, isOn: false)
                            self!.navigationController?.pushViewController(vc, animated: true)
                        })
                    
                    Button("MapView")
                        .addAction(.touchUpInside, handler: {[weak self] _ in
                            let vc = MapViewController()
                            self!.navigationController?.pushViewController(vc, animated: true)
                        })

                    Button("Actor")
                        .addAction(.touchUpInside, handler: {[weak self] _ in
                            let vc = ActorViewController()
                            self!.navigationController?.pushViewController(vc, animated: true)
                        })

                    Button("WKWebView")
                        .addAction(.touchUpInside, handler: {[weak self] _ in
                            let vc = WebViewController()
                            self!.navigationController?.pushViewController(vc, animated: true)
                        })

                    Button("ProgressView")
                        .addAction(.touchUpInside, handler: {[weak self] _ in
                            let vc = ProgressViewViewController()
                            self!.navigationController?.pushViewController(vc, animated: true)
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

//import SwiftUI
//
//#Preview {
//    RootViewController()
//}
