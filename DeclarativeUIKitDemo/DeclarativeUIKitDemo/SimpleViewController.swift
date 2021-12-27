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
            UIView.spacer().height(0.5).backgroundColor(.gray)
        }
        let MarginView = {
            UIView.spacer().height(20).backgroundColor(.lightGray)
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
                UIStackView.horizontal(distribution: .fill) {
                    UIView()
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
                        .backgroundColor(.systemRed)
                        .transform(.init(rotationAngle: 45.0/360 * Double.pi))
                    UIView {
                        $0.heightConstraint = 100
                        $0.widthConstraint = 100
                        $0.backgroundColor = .black
                    }
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
                        button.addTarget(self, action: #selector(self.tapButton), for: .touchUpInside)
                    }
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
                
        self.declarate {
            UIScrollView.vertical {
                UIStackView.vertical {
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
                }
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
}

import SwiftUI

struct SimpleViewController_Wrapper: UIViewControllerRepresentable {
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
          SimpleViewController_Wrapper()
      }
  }
}
