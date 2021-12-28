# DeclarativeUIKit

UIKitのAutolayoutを宣言的に記述するライブラリです


## Motivation

UIKitのプロジェクトからSwiftUIに移行するためには根本の設計から変える必要がある場合があり、さらにUIKitからSwiftUIやSwiftUIからUIKitの相互の連携がどうしても必要になります。

またSwiftUIはCombineを用いたMVVM設計を基本とするため、それ以外のアーキテクチャを採用していたりリアクティブプログラミングの学習が十分でないプロジェクトの場合、導入の敷居が高くなります。

そのため、あくまでもUIKitをメインとして既存のレイアウトの定義だけを宣言的に記述するためのライブラリとしました。


## Installation

### SwiftPackageManager

Once you have your Swift package set up, adding DeclarativeUIKit as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```swift
dependencies: [
    .package(url: "https://github.com/sakiyamaK/DeclarativeUIKit", .upToNextMajor(from: "0.2"))
]
```

To install IQKeyboardManager package via Xcode

Go to File -> Swift Packages -> Add Package Dependency...
Then search for https://github.com/sakiyamaK/DeclarativeUIKit
And choose the version you want


## Usage

### Quick Start

```swift
import UIKit
import DeclarativeUIKit

class DeclarativeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        //最初にdeclarateを呼びます
        self.declarate {

            //中にひとつのViewを配置できます
            //複数のViewを置くことはできません
            //UIScrollViewを置くことを推奨します
            UIScrollView.vertical {

                //UIScrollViewの中も同様でひとつのViewしか配置できません
                //UIStackViewを置くことを推奨します
                UIStackView.vertical {

                    //UIViewを横に並べます
                    UIScrollView.horizontal(margin: .init(top: 20, left: 10, bottom: 20, right: 10)) {
                        UIStackView.horizontal(distribution: .fill) {
                            UIView()
                                .width(100)
                                .height(100)
                                .backgroundColor(.red)
                                .cornerRadius(30, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMaxYCorner])
                            UIView()
                                .size(width: 100, height: 100)
                                .backgroundColor(.systemGreen)
                                .transform(.init(rotationAngle: 45.0/360 * Double.pi))
                            UIView()
                                .size(width: 100, height: 100)
                                .border(color: .systemBlue, width: 10)
                                .shadow(color: .black.withAlphaComponent(0.7), radius: 10, x: 5, y: 5)
                        }.spacing(30)
                    }
                    .showsScrollIndicator(false)

                    //これ以降のViewはセンター揃えにするため新しくUIStackViewを置きます
                    UIStackView.vertical {
                        UIImageView {
                            //UIKit既存の手続的な設定はこのように記述できます
                            guard let imageView = $0 as? UIImageView else { return }
                            imageView.image = UIImage.init(systemName: "square.and.arrow.up")
                        }
                        .contentMode(.scaleAspectFit)
                        .size(width: 100, height: 100)
                        
                        //インスタンス生成後にimperativeを明示しても手続的設定ができます
                        UIButton().imperative {
                            guard let button = $0 as? UIButton else { return }
                            button.setTitle("UIButton", for: .normal)
                            button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
                            button.contentEdgeInsets = .init(top: 10, left: 10, bottom: 10, right: 10)
                        }
                        .backgroundColor(.systemBlue)
                        .cornerRadius(10)
                        
                        UILabel {
                            guard let label = $0 as? UILabel else { return }
                            label.text = "UILabel"
                            label.font = UIFont.systemFont(ofSize: 30)
                            label.textAlignment = .center
                        }
                        
                        //z方向の配置は各ViewにzStackかaddSubViewメソッドを呼ぶことで実現できます
                        UIImageView {
                            guard let imageView = $0 as? UIImageView else { return }
                            imageView.image = UIImage.init(systemName: "square.and.arrow.down")
                        }
                        .contentMode(.scaleAspectFit)
                        .size(width: 150, height: 150)
                        .zStack(margin: .init(top: 70, left: 10, bottom: 0, right: 10)) {
                            UILabel {
                                guard let label = $0 as? UILabel else { return }
                                label.text = "zStack"
                                label.textColor = .black
                                label.textAlignment = .center
                                label.font = UIFont.boldSystemFont(ofSize: 30)
                            }
                        }
                    }
                    .spacing(50)
                    .alignment(.center)
                }.spacing(50)
            }
        }
    }
}
```

### Preview

Xcode Previewによりビルドすることなくレイアウトを確認することができます

```swift
import SwiftUI

struct DeclarativeViewController_Wrapper: UIViewControllerRepresentable {
    typealias ViewController = DeclarativeViewController

    func makeUIViewController(context: Context) -> ViewController {
        let vc = ViewController()
        return vc
    }
    
    func updateUIViewController(_ vc: ViewController, context: Context) {
    }
}

struct DeclarativeViewController_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DeclarativeViewController_Wrapper()
        }
    }
}
```

[![Image from Gyazo](https://i.gyazo.com/5b971480cc4a93381d3bbc4711ec17d5.png)](https://gyazo.com/5b971480cc4a93381d3bbc4711ec17d5)