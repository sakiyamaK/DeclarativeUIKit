//
//  SimpleViewController.swift
//  DeclarativeUIKitDemo
//
//  Created by sakiyamaK on 2021/12/27.
//

import UIKit
import DeclarativeUIKit

final class SimpleViewController: UIViewController {
    
    enum ViewTag: Int {
        case button = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let Border = {
            UIView.divider().backgroundColor(.gray)
        }
        let MarginView = {
            UIView.spacer().height(40).backgroundColor(.lightGray)
        }
        
        let Header = { (title: String) -> UIView in
            UIStackView.vertical {
                UILabel {
                    guard let label = $0 as? UILabel else { return }
                    label.text = title
                    label.textColor = .black
                    label.textAlignment = .center
                    label.numberOfLines = 0
                    label.font = UIFont.systemFont(ofSize: 30)
                }
                UIView.spacer().height(10)
                Border()
            }
        }
        
        let ScrollBlocksView = {
            UIScrollView.horizontal(margin: .init(top: 20, left: 10, bottom: 20, right: 10)) {
                UIStackView.horizontal(distribution: .fill) { stackView in
                    UIView()
                        .imperative { _ in
                            print(stackView)
                        }
                        .width(100)
                        .height(100)
                        .backgroundColor(.red)
                    UIView()
                        .width(100)
                        .aspectRatio(1.0)
                        .backgroundColor(.green)
                        .cornerRadius(30, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMaxYCorner])
                    UIView()
                        .size(width: 100, height: 100)
                        .border(color: .blue, width: 10)
                    UIView()
                        .size(width: 100, height: 100)
                        .backgroundColor(.black)
                        .transform(.init(rotationAngle: 45.0/360 * Double.pi))
                    UIView {
                        $0.heightConstraint = 100
                        $0.widthConstraint = 100
                        $0.backgroundColor = .systemRed
                    }
                    .shadow(color: .black.withAlphaComponent(0.8), radius: 10, x: 5, y: 5)
                    
                    UIView()
                        .backgroundColor(.systemRed)
                        .padding()
                        .backgroundColor(.systemYellow)
                        .size(width: 100, height: 100)
                    
                }.spacing(20)
            }
            .showsScrollIndicator(false)
        }
        
        let CenteringView = {
            UIStackView.horizontal {
                UIStackView.vertical {
                    UIImageView {
                        guard let imageView = $0 as? UIImageView else { return }
                        imageView.image = UIImage.init(systemName: "square.and.arrow.up")
                    }
                    .contentMode(.scaleAspectFit)
                    .height(200)
                    
                    UIButton {
                        guard let button = $0 as? UIButton else { return }
                        button.setTitle("button", for: .normal)
                        button.setTitleColor(.brown, for: .normal)
                    }
                    .add(target: self, action: #selector(self.tapButton), for: .touchUpInside)
                    .tag(ViewTag.button.rawValue)
                    
                    UILabel {
                        guard let label = $0 as? UILabel else { return }
                        label.text = "センターだね"
                        label.textAlignment = .center
                    }
                }
                .spacing(30)
            }
            .alignment(.center)
        }
        
        let ZStackView = {
            UIStackView.horizontal {
                UIImageView {
                    guard let imageView = $0 as? UIImageView else { return }
                    imageView.image = UIImage.init(systemName: "square.and.arrow.down")
                }
                .height(200)
                .contentMode(.scaleAspectFit)
                .zStack(margin: .init(top: 70, left: 10, bottom: 0, right: 10)) {
                    UILabel {
                        guard let label = $0 as? UILabel else { return }
                        label.text = "上に重なってるね"
                        label.textColor = .black
                        label.textAlignment = .center
                        label.font = UIFont.boldSystemFont(ofSize: 30)
                    }
                }
            }.alignment(.center)
        }
        
        let Geometry = {
            UIView()
                .backgroundColor(.red)
                .zStack {
                    UIStackView.horizontal { superview in
                        UIView()
                            .backgroundColor(.blue)
                            .heightEqual(to: superview, constraint: superview.heightAnchor - 20)
                        
                        UIView()
                            .backgroundColor(.green)
                            .widthEqual(to: superview, constraint: superview.widthAnchor * 0.4)
                            .heightEqual(to: superview, constraint: superview.heightAnchor / 2 + 10)
                    }
                    .height(100)
                    .alignment(.center)
                }
        }
        
        let SomeViews = {
            Array(1...10).compactMap { num in
                UILabel {
                    guard let label = $0 as? UILabel else { return }
                    label.text = "\(num)番目のlabel"
                    label.textColor = .black
                    label.textAlignment = .center
                }
            }
        }
        
        self.declarative {
            UIScrollView {
                UIStackView {
                    Header("UIViewの設定")
                    UIView.spacer().height(20)
                    ScrollBlocksView()
                    UIView.spacer().height(20)
                    MarginView()
                    UIView.spacer().height(10)
                    Header("レイアウト以外の設定は手続的にする")
                    UIView.spacer().height(20)
                    CenteringView()
                    UIView.spacer().height(20)
                    MarginView()
                    UIView.spacer().height(10)
                    Header("Z方向の設定")
                    ZStackView()
                    MarginView()
                    UIView.spacer().height(30)
                    Header("親ビューの大きさで設定")
                    Geometry()
                    UIView.spacer().height(20)
                    MarginView()
                    UIView.spacer().height(30)
                    Header("配列で用意")
                    UIView.spacer().height(20)
                    SomeViews()
                    UIView.spacer().height(20)
                }
            }
            .refreshControl {
                UIRefreshControl()
                .add(target: self, action: #selector(refresh), for: .valueChanged)
            }
        }
        
    }
}

@objc private extension SimpleViewController {
    func tapButton(_ sender: UIButton) {
        print("ボタンをタップしたね")
        if let button = self.getView(tag: ViewTag.button.rawValue) as? UIButton {
            print(button)
        }
    }
    
    func refresh(_ sender: UIRefreshControl) {
        print("refresh")
        if sender.isRefreshing {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                sender.endRefreshing()
            }
        }
    }
}

import SwiftUI

private struct ViewController_Wrapper: UIViewControllerRepresentable {
    typealias ViewController = SimpleViewController
    // 初期化メソッド
    func makeUIViewController(context: Context) -> ViewController {
        let vc = ViewController()
        return vc
    }
    
    // 更新用のメソッド
    func updateUIViewController(_ vc: ViewController, context: Context) {
    }
}

struct SimpleViewController_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewController_Wrapper()
        }
    }
}
