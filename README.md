# DeclarativeUIKit

[![Swift](https://img.shields.io/badge/Swift-5-orange?style=flat-square)](https://img.shields.io/badge/Swift-5-Orange?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-iOS_-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-iOS_-yellowgreen?style=flat-square)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
[![Twitter](https://img.shields.io/badge/twitter-@sakiyamaK-blue.svg?style=flat-square)](https://twitter.com/sakiyamaK)

UIKitのAutolayoutを宣言的に記述するライブラリです

* [Motivation](#motivation)
* [Example](#example)
* [Installation](#installation)
  * [Swift Package Manager](#swift-package-manager)
* [Usage](#usage)
  * [Setting for writing declarative](#setting-for-writing-declarative)
  * [Accessing declaratived view](#accessing-declaratived-view)
  * [UIScrollView](#uIScrollView)
  * [UIStackView](#uIStackView)
  * [UIView](#uIView)
      * [basic parameters](#basic-parameters)
      * [complex parameters](#complex-parameters)
      * [to use the parent view](#to-use-the-parent-view)
      * [overlay](#overlay)
      * [imperative](#imperative)
* [Quick Start](#quick-start)
* [Xcode Preview](#xcode-preview)
## Motivation

UIKitのプロジェクトからSwiftUIに移行するためには根本の設計から変える必要がある場合があり、さらにUIKitからSwiftUIやSwiftUIからUIKitの相互の連携がどうしても必要になります。

またSwiftUIはCombineを用いたMVVM設計を基本とするため、それ以外のアーキテクチャを採用していたりリアクティブプログラミングの学習が十分でないプロジェクトの場合、導入の敷居が高くなります。

そのため、あくまでもUIKitをメインとして既存のレイアウトの定義だけを宣言的に記述するためのライブラリとしました。

## Example

[Demo Projects](https://github.com/sakiyamaK/DeclarativeUIKit/tree/main/DeclarativeUIKitDemo)

## Installation

### Swift Package Manager

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

### Setting for writing declarative

`UIViewController`の`viewDidLoad`で`declarate`メソッドを記述します

Write the `declarate` method in `viewDidLoad` of `UIViewController`.

```swift
class DeclarativeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //最初にdeclarateメソッドを記述します
        //Write the declare method first
        self.declarate {
          //ここに宣言的にレイアウトを記述していきます
          //ひとつのUIViewを配置できます
          //UIScrollViewを置くことを推奨します
          //we'll describe the layout declaratively here
        }
    }
}
```

### Accessing declaratived view

宣言的に記述されたViewはパラメータに代入されていないため`tag`を指定して`UIViewController`か`UIView`の`getView`メソッドでアクセスできます

```swift
class DeclarativeViewController: UIViewController {

  private enum ViewTag {
    case button = 1
  }

  override func viewDidLoad() {
      super.viewDidLoad()
      self.declarate {
        UIButton {
          guard let button = $0 as? UIButton else { return }
          button.setTitle("button", for: .normal)
          button.addTarget(self, action: #selector(self.tapButton), for: .touchUpInside)
        }
        //tagを設定
          .tag(ViewTag.button.rawValue)
      }
  }

  @obj func tapButton(_ sender: UIButton) {
    //getViewでtagを指定して取得
    if let button = self.getView(tag: ViewTag.button.rawValue) as? UIButton {
      print(button)
    }
  }
}
```

### UIScrollView

`UIScrollView.vertical`もしくは`UIScrollView.horizontal`と記載します

```swift
self.declarate {
  UIScrollView.vertical(margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
    //ひとつのUIViewを配置できます
    //UIStackViewを置くことを推奨します
  }
  .isScrollEnabled(true)
  .showsScrollIndicator(true)
}
```

### UIStackView
`UIStackView.vertical`もしくは`UIStackView.horizontal`と記載します
`UIStackView`は自身のインスタンスを伝搬させることができます

```swift
self.declarate {
  UIStackView.vertical { stackView in
    //この中に複数のUIViewを配置できます
  }
  .alignment(.fill)
  .distribution(.fill)
  .spacing(0)
}
```

### UIView

`UIView`の様々なパラメータが宣言的に記述できるようになっています

#### basic parameters

基本的なパラメータの使い方です

```swift
UIStackView.vertical {

  //基本的なパラメータ
  UIView()
    .width(100)
    .height(100)
    .backgroundColor(.white)
    .isHidden(false)
    .alpha(1.0)
    .contentMode(.scaleAspectFit)
    .isUserInteractionEnabled(true)
    .tag(1)

  //基本的なパラメータの別の記法
  UIView()
    //width, heightの代わり
    .size(width: 100, height: 100)
    //isHddenと逆の処理
    .isShow(true)

  //基本的なパラメータの別の記法
  UIView()
    .width(100)
    //widthに対する高さの比率
    .aspectRatio(1.0)

  //基本的なパラメータの別の記法
  UIView()
    .width(100)
    //widthに対する高さの比率
    .aspectRatio(1.0)

  //大きさに関するその他パラメータ
  UIView()
    //最小サイズ
    .minWidth(10)
    .minHeight(10)
    //最大サイズ
    .maxWidth(100)
    .maxHeight(100)

  //大きさに関するその他パラメータの別の記法
  UIView()
    .minSize(width: 10, height: 10)
    .maxSize(width: 100, height: 100)
}
```

#### complex parameters
複雑なパラメータの使い方です

```swift
UIStackView.vertical {
  //複雑なパラメータ
  UIView()
    .shadow(color: .white, radius: 10, x: 0, y: 10)
    .border(color: .white, width: 10)
    .cornerRadius(10, maskedCorners: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner])
```

#### to use the parent view
親Viewのサイズに基づいて大きさを決めたい場合は`widthEqual`や`heightEqual`を使います

```swift
UIStackView.vertical { stackView in
  UIView()
    //親ビュー(UIStackView)のパラメータを代入する
    .widthEqual(to: stackView, constraint: stackView.widthAnchor)
    //heightAnchorなどのNSLayoutDimensionは四則演算も対応している
    .heightEqual(to: stackView, constraint: stackView.heightAnchor * 0.8 + 10)
}
```

#### overlay

`addSubview`か`zStack`メソッドで上にViewを重ねることができます

```swift
UIStackView.vertical {
  UIView()
    .addSubview(margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        UIStackView.vertical {
            UIView()
        }
    }

  UIView()
    .zStack {
      UIStackView.vertical {
        UIView()
      }
  }
}
```

#### imperative
宣言的な記述が非対応のパラメータを設定する場合、 `imperative`メソッドを使うことで`UIKit`本来の手続的な記述ができます

これにより`UIKit`のすべてのViewが宣言的に記述してレイアウトを組めます

```swift
UIStackView.vertical { stackView in
  UIView()
    .imperative {
        if hoge {
            $0.backgroundColor = .red
        } else {
            $0.backgroundColor = .blue
        }
    }

  //imperativeは省略できる
  UIView {
    if hoge {
        $0.backgroundColor = .red
    } else {
        $0.backgroundColor = .blue
    }
  }

  //UILabelを使う場合
  UILabel {
    guard let label = $0 as? UILabel else { return }
    label.text = "テスト"
  }
}
```

#### spacer
レイアウトに余白を付けるためのメソッドです

```swift
UIStackView.vertical {
  UIView.spacer()
  .height(20)

  //こう記述しているのと変わりません
  UIView()
  .isUserInteractionEnabled(false)
  .height(20)
}
```

### Array

配列からViewを生成することもできます

```swift
UIStackView.vertical {
  Array(1...10).compactMap { num in
    UILabel {
      guard let label = $0 as? UILabel else { return }
      label.text = "\(num)番目のlabel"
      label.textColor = .black
      label.textAlignment = .center
    }
  }
}
```

### Quick Start

実例です

```swift
import UIKit
import DeclarativeUIKit

class DeclarativeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.declarate {

            UIScrollView.vertical {

                UIStackView.vertical {

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

                    UIStackView.vertical {
                        UIImageView {

                            guard let imageView = $0 as? UIImageView else { return }
                            imageView.image = UIImage.init(systemName: "square.and.arrow.up")
                        }
                        .contentMode(.scaleAspectFit)
                        .size(width: 100, height: 100)
                        
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

### Xcode Preview

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