//
//  ViewController.swift
//  DeclarativeUIKitDemo
//
//  Created by sakiyamaK on 2021/12/25.
//

import UIKit
import DeclarativeUIKit

final class DeclarativeViewController: UIViewController {
    
    enum ViewTag: Int {
        case button = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let header = {
            UIStackView.vertical {
                UILabel {
                    //レイアウト以外の設定は既存の通り手続的に書ける
                    guard let label = $0 as? UILabel else { return }
                    label.text = "Declative UIKit"
                    label.textColor = .black
                    label.textAlignment = .center
                    label.font = UIFont.systemFont(ofSize: 30)
                }
            }
        }
        
        let scrollBlocksView = {
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
                        .backgroundColor(.systemCyan)
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
        
        let centeringView = {
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
        
        let zStackView = {
            UIStackView.horizontal {
                UIImageView {
                    guard let imageView = $0 as? UIImageView else { return }
                    imageView.image = UIImage.init(systemName: "square.and.arrow.down")
                }
                .size(width: 200, height: 200)
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
        
        let border = {
            UIView.spacer().height(0.5).backgroundColor(.gray)
        }
        
        self.declarate {
            UIScrollView.vertical {
                UIStackView.vertical {
                    header()
                    UIView.spacer().height(10)
                    border()
                    UIView.spacer().height(20)
                    scrollBlocksView()
                    UIView.spacer().height(20)
                    border()
                    UIView.spacer().height(20)
                    centeringView()
                    UIView.spacer().height(20)
                    border()
                    UIView.spacer().height(20)
                    zStackView()
                    UIView.spacer().height(20)
                    border()
                    UIView.spacer().height(10)
                }
            }
        }
    }
}

@objc private extension DeclarativeViewController {
    func tapButton(_ sender: UIButton) {
        print("ボタンをタップしたね")
        if let button = self.getView(tag: ViewTag.button.rawValue) as? UIButton {
            print(button)
        }
    }
}


import SwiftUI

struct DeclarativeViewController_Wrapper: UIViewControllerRepresentable {
    // プレビュー用のデータを返すスタブ
//    var presenter: PresenterStub

    // 初期化メソッド
    func makeUIViewController(context: Context) -> DeclarativeViewController {
        let vc = DeclarativeViewController()
//        vc.presenter = presenter
//        presenter.view = vc
        return vc
    }

    // SwiftUI側から更新がかかったときに呼ばれるメソッド
    func updateUIViewController(_ vc: DeclarativeViewController, context: Context) {
        // 更新用のメソッド
//        presenter.didPushFetchButton()
    }
}
struct DeclarativeViewController_Previews: PreviewProvider {
  static var previews: some View {
      Group {
          DeclarativeViewController_Wrapper()
      }
  }
}
