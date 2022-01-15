# DeclarativeUIKit

[![Swift](https://img.shields.io/badge/Swift-5-orange?style=flat-square)](https://img.shields.io/badge/Swift-5-Orange?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-iOS_-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-iOS_-yellowgreen?style=flat-square)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
[![Twitter](https://img.shields.io/badge/twitter-@sakiyamaK-blue.svg?style=flat-square)](https://twitter.com/sakiyamaK)

UIKitのAutolayoutを宣言的に記述するライブラリです

Library for writing UIKit Autolayout declaratively.

* [Motivation](#motivation)
* [Example](#example)
* [Installation](#installation)
  * [Swift Package Manager](#swift-package-manager)
  * [CocoaPods](#cocoapods)
* [Document](https://github.com/sakiyamaK/DeclarativeUIKit/tree/add_document/Documentation)
* [Usage](#usage)
  * [Setting for writing declarative](#setting-for-writing-declarative)
  * [UIScrollView](#uIScrollView)
  * [UIStackView](#uIStackView)
  * [UIView](#uIView)
      * [basic parameters](#basic-parameters)
      * [complex parameters](#complex-parameters)
      * [to use the parent view](#to-use-the-parent-view)
      * [overlay](#overlay)
      * [imperative](#imperative)
      * [spacer](#spacer)
      * [Array](#array)
  * [UITableView,UICollectionView](#uitablewviewuicollectionview)
  * [UIControl](#uIControl)
  * [UIBezierPath](#uIBezierPath)
* [Quick Start](#quick-start)
* [Xcode Preview](#xcode-preview)

## Motivation

UIKitのプロジェクトからSwiftUIに移行するためには根本の設計から変える必要がある場合があり、さらにUIKitからSwiftUIやSwiftUIからUIKitの相互の連携がどうしても必要になります。

In order to migrate from a UIKit project to SwiftUI, it may be necessary to change the underlying design, and furthermore, the interworking of UIKit to SwiftUI and SwiftUI to UIKit is inevitable.

またSwiftUIはCombineを用いたMVVM設計を基本とするため、それ以外のアーキテクチャを採用していたりリアクティブプログラミングの学習が十分でないプロジェクトの場合、導入の敷居が高くなります。

In addition, since SwiftUI is based on MVVM design using Combine, projects that use other architectures or have not sufficiently learned reactive programming will have a higher threshold for implementation.

そのためUIKitをメインとして既存のレイアウトの定義だけを宣言的に記述できるライブラリとしました。

For this reason, we decided to use UIKit as the main library where only the existing layout definitions can be written declaratively.

## Example

* [Demo Projects](https://github.com/sakiyamaK/DeclarativeUIKit/tree/main/DeclarativeUIKitDemo)

  * [basic](https://github.com/sakiyamaK/DeclarativeUIKit/tree/main/DeclarativeUIKitDemo/DeclarativeUIKitDemo/Simple)
    
    基礎的な使い方のサンプルです

    Here is a sample of basic usage

    <img src="https://i.gyazo.com/5b971480cc4a93381d3bbc4711ec17d5.png" width=500>

  * [collection view](https://github.com/sakiyamaK/DeclarativeUIKit/tree/main/DeclarativeUIKitDemo/DeclarativeUIKitDemo/Collection)
    
    UICollectionViewの基礎のサンプルです

    This is a sample of the basics of UICollectionView.

    <img src="https://i.gyazo.com/cf53ffbec92922b6bc33df6ef254e167.png" width=500>
    
  * [MVP](https://github.com/sakiyamaK/DeclarativeUIKit/tree/main/DeclarativeUIKitDemo/DeclarativeUIKitDemo/Github)
    
    MVPアーキテクチャでGithub APIを実行するサンプルです

    This is a sample of running the Github API on the MVP architecture.

    <img src="https://gyazo.com/041c6d3f10612f41bc61c9c071d9d62a.png" width=500>

  * [copy SwiftUI tutorial chapter 1](https://github.com/sakiyamaK/DeclarativeUIKit/tree/main/DeclarativeUIKitDemo/DeclarativeUIKitDemo/CopyAppleSwiftUITutorial)
    
    [Apple公式のSwiftUIチュートリアルのChapter 1](https://developer.apple.com/tutorials/swiftui)を真似たサンプルです

    This is a sample that mimics [Chapter 1 of Apple's official SwiftUI tutorial](https://developer.apple.com/tutorials/swiftui).

    <img src="https://i.gyazo.com/bd5e96207609de6a4cb6f91adc6a6a6e.png" width=500>

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

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate Alamofire into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'DeclarativeUIKit'
```

## Usage

### Setting for writing declarative

`UIViewController`の`viewDidLoad`で`declarative`メソッドを記述します

Write the `declarative` method in `viewDidLoad` of `UIViewController`.

```swift
class DeclarativeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //最初にdeclarativeメソッドを記述します
        //Write the declare method first
        self.declarative {
          //ここに宣言的にレイアウトを記述していきます
          //ひとつのUIViewを配置できます
          //UIScrollViewを置くことを推奨します
          //Declaratively describe the layout here.
          //You can place a single UIView
          //It is recommended to place a UIScrollView
        }
    }
}
```

### UIScrollView

`UIScrollView.vertical`もしくは`UIScrollView.horizontal`と記載します

It should write `UIScrollView.vertical` or `UIScrollView.horizontal`

```swift
self.declarative {
  UIScrollView.vertical(margin: UIEdgeInsets.zero) {
    //ひとつのUIViewを配置できます
    //UIStackViewを置くことを推奨します
    //You can place a single UIView
    //It is recommended to place a UIStackView
  }
  .isScrollEnabled(true)
  .showsScrollIndicator(true)
  .refreshControl {
      UIRefreshControl()
          .addControlAction(target: self, for: .valueChanged) {
              #selector(refresh)
          }
  }
}
```

### UIStackView
`UIStackView.vertical`もしくは`UIStackView.horizontal`と記載します
`UIStackView`は自身のインスタンスを伝搬させることができます

It should say `UIStackView.vertical` or `UIStackView.horizontal
A `UIStackView` can propagate its own instance.

```swift
self.declarative {
  UIStackView.vertical { stackView in
    //この中に複数のUIViewを配置できます
    //Multiple UIViews can be placed in this
  }
  .alignment(.fill)
  .distribution(.fill)
  .spacing(0)
}
```

### UIView

`UIView`の様々なパラメータが宣言的に記述できるようになっています

Various parameters of `UIView` can now be described declaratively.

#### basic parameters

基本的なパラメータの使い方です

Here is the basic parameter usage

```swift
UIStackView.vertical {

  //基本的なパラメータ
  //Basic Parameters
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
  //Another notation for basic parameters
  UIView()
    //width, heightの代わり
    //instead of width, height
    .size(width: 100, height: 100)
    //isHddenと逆の処理
    //isHdden and the reverse process
    .isShow(true)

  //基本的なパラメータの別の記法
  //Another notation for basic parameters
  UIView()
    .width(100)
    //widthに対する高さの比率
    //height as a percentage ofwidth
    .aspectRatio(1.0)

  //基本的なパラメータの別の記法
  //Another notation for basic parameters
  UIView()
    .width(100)
    //widthに対する高さの比率
    //height as a percentage ofwidth
    .aspectRatio(1.0)

  //大きさに関するその他パラメータ
  //other parameters related to size
  UIView()
    //最小サイズ
    //Minimum size
    .minWidth(10)
    .minHeight(10)
    //最大サイズ
    //Maximum size
    .maxWidth(100)
    .maxHeight(100)

  //大きさに関するその他パラメータの別の記法
  //Another notation for other parameters related to size
  UIView()
    .minSize(width: 10, height: 10)
    .maxSize(width: 100, height: 100)
}
```

#### complex parameters
複雑なパラメータの使い方です

It's a complex parameter usage.

```swift
UIStackView.vertical {
  //複雑なパラメータ
  //Complex parameters
  UIView()
    .shadow(color: .white, radius: 10, x: 0, y: 10)
    .border(color: .white, width: 10)
    .cornerRadius(10, maskedCorners: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner])
    .addGestureRecognizer {
        UITapGestureRecognizer(target: self) {
            #selector(self.tapView)
        }
    }


  //複雑なパラメータ padding
  //Complex parameters padding

  //paddingは自身の後ろにViewをひとつ付け足します
  //padding will add a View after itself
  UIView()
    .backgroundColor(.green)
    .padding(10)
    //paddingの上下左右ごとにも設定できます
    //padding can also be set for each of the top, bottom, left and right
    .padding(insets: UIEdgeInsets.init(top: 10, left: 20, bottom: 0, right: 30))
    //padding以降で呼び出したメソッドは後ろのメソッドに設定されます
    //Methods called after padding will be set to the method after it
    .backgroundColor(.red)

    //paddingは次のように設定していることと変わりません
    //padding is no different than setting it as follows
    UIView()
      .zStack { 
        UIView()
       }
```

#### to use the parent view
親Viewのサイズに基づいて大きさを決めたい場合は`widthEqual`や`heightEqual`を使います

Use `widthEqual` or `heightEqual` if you want the size to be based on the size of the parent View

```swift
UIStackView.vertical { stackView in
  UIView()
    //親ビュー(UIStackView)のパラメータを代入できます
    //assign the parameters of the parent view (UIStackView)
    .widthEqual(to: stackView, constraint: stackView.widthAnchor)
    //heightAnchorなどのNSLayoutDimensionは四則演算も対応しています
    //NSLayoutDimension, such as heightAnchor, also supports quadrature operations.
    .heightEqual(to: stackView, constraint: stackView.heightAnchor * 0.8 + 10)
}
```

#### overlay

`addSubview`か`zStack`メソッドで上にViewを重ねることができます

You can use the `addSubview` or `zStack` methods to add a View on top

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

When setting parameters that are not supported by declarative descriptions, you can use the `imperative` method to write them procedurally as `UIKit` should.

これにより`UIKit`のすべてのViewが宣言的に記述してレイアウトを組めます

This allows all views in `UIKit` to be declaratively described and laid out

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

  //()は省略できます
  //() can be omitted
  UIView.imperative {
    if hoge {
        $0.backgroundColor = .red
    } else {
        $0.backgroundColor = .blue
    }
  }

  //UILabelを使う場合
  //When using UILabel
  UILabel.imperative {
    let label = $0 as! UILabel
    label.text = "テスト"
  }
}
```

#### spacer
レイアウトに余白を付けるためのメソッドです

This method is used to add margins to the layout

```swift
UIStackView.vertical {
  UIView.spacer()
  .height(20)

  //こう記述しているのと変わりません
  //It's no different than describing it this way
  UIView()
  .isUserInteractionEnabled(false)
  .height(20)
}
```

### Array

配列からViewを生成することもできます

You can also create a View from an array

```swift
UIStackView.vertical {
  Array(1...10).compactMap { num in
    UILabel.imperative {
      let label = $0 as! UILabel
      label.text = "\(num)番目のlabel"
      label.textColor = .black
      label.textAlignment = .center
    }
  }
}
```

### UITableView,UICollectionView

UITableViewとUICollectionViewのいくつかのパラメータは宣言的に設定することができます

Some parameters of UITableView, UICollectionView can be set declaratively

```swift

UITablewView()
  .delegate(self)
  .dataSource(self)
  .prefetchDataSource(self)
  .dragDelegate(self)
  .dropDelegate(self)
  .registerCellClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  .registerViewClass(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Header")
  .registerViewClass(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Footer")

UICollectionView {
    UICollectionViewFlowLayout()
}
.dataSource(self)
.delegate(self)
.prefetchDataSource(self)
.dragDelegate(self)
.dropDelegate(self)
.registerCellClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
.registerViewClass(UIView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")

```

### UIControl

アクションの設定が宣言的に書けるようになっています

Touch action settings can be written declaratively.

```swift
UIButton.imperative {
    let button = $0 as! UIButton
    button.setTitle("button", for: .normal)
    button.setTitleColor(.brown, for: .normal)
}
.addControlAction(target: self, for: .touchUpInside) {
    #selector(self.tapButton)
}

UIScrollView {
  UIStackView {
  }
}
.refreshControl {
    UIRefreshControl()
        .addControlAction(target: self, for: .valueChanged) {
            #selector(refresh)
        }
}
```

### UIBezierPath

`UIView.path`メソッドを呼び出して`UIBezierPath`を宣言的に記述できます

The `UIView.path` method can be called to declaratively describe the `UIBezierPath`.

```swift
UIStackView { superview in 
  UIView.path {
      let size = superview.frame.size

      //宣言的に書ける
      UIBezierPath().imperative {
          $0.move(to: CGPoint(x: 0, y: size.height))
          $0.addLine(to: CGPoint(x: size.width, y: 0))
      }.stroke(.green, lineWidth: 10)

      UIBezierPath.imperative {
          $0.move(to: CGPoint(x: 0, y: 0))
          $0.addLine(to: CGPoint(x: size.width, y: size.height))
      }.stroke(.red, lineWidth: 10)

      //既存の書き方でもいい
      let path = UIBezierPath()
      path.move(to: CGPoint(x: size.width/2, y: 0))
      path.addLine(to: CGPoint(x: size.width/2, y: size.height))
      UIColor.blue.setStroke()
      path.lineWidth = 10
      path.stroke()
  }
}
```

## Quick Start

実例です

A practical example.

```swift
import UIKit
import DeclarativeUIKit

final class SimpleViewController: UIViewController {
    
    enum ViewTag: Int {
        case button = 1, tapLabel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let Border = {
            UIView.divider().backgroundColor(.gray)
        }
        
        let Header = { (title: String) -> UIView in
            UIStackView.vertical {
                UILabel.imperative {
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
                    UIView.imperative {
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
                    UIImageView.imperative {
                        let imageView = $0 as! UIImageView
                        imageView.image = UIImage.init(systemName: "square.and.arrow.up")
                    }
                    .contentMode(.scaleAspectFit)
                    .height(200)
                    
                    UIButton.imperative {
                        let button = $0 as! UIButton
                        button.setTitle("button", for: .normal)
                        button.setTitleColor(.brown, for: .normal)
                    }
                    .addControlAction(target: self, for: .touchUpInside) {
                        #selector(self.tapButton)
                    }
                    .tag(ViewTag.button.rawValue)
                    
                    UILabel(tag: ViewTag.tapLabel.rawValue).imperative {
                        let label = $0 as! UILabel
                        label.text = "タップジェスチャーのあるラベル"
                        label.textAlignment = .center
                    }
                    .isUserInteractionEnabled(true)
                    .addGestureRecognizer {
                        UITapGestureRecognizer(target: self) {
                            #selector(self.tapLabel(_:))
                        }
                    }
                }
                .spacing(30)
            }
            .alignment(.center)
        }
        
        let ZStackView = {
            UIStackView.horizontal {
                UIImageView.imperative {
                    let imageView = $0 as! UIImageView
                    imageView.image = UIImage.init(systemName: "square.and.arrow.down")
                }
                .height(200)
                .contentMode(.scaleAspectFit)
                .zStack(margin: .init(top: 70, left: 10, bottom: 0, right: 10)) {
                    UILabel.imperative {
                        let label = $0 as! UILabel
                        label.text = "上に重なってるね"
                        label.textColor = .black
                        label.textAlignment = .center
                        label.font = UIFont.boldSystemFont(ofSize: 30)
                    }
                }
            }.alignment(.center)
        }
        
        let SomeViews = {
            Array(1...10).compactMap { num in
                UILabel.imperative {
                    let label = $0 as! UILabel
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
                    CenteringView()
                    UIView.spacer().height(20)
                    ZStackView()
                    UIView.spacer().height(30)
                    SomeViews()
                    UIView.spacer().height(20)
                }
            }
            .refreshControl {
                UIRefreshControl()
                    .addControlAction(target: self, for: .valueChanged) {
                        #selector(refresh)
                    }
            }
        }
    }
}

@objc private extension SimpleViewController {
    func tapLabel(_ sender: UIGestureRecognizer) {
        print("ラベルをタップしたね")
    }
    
    func tapButton(_ sender: UIButton) {
        print("ボタンをタップしたね")
    }
    
    func refresh(_ sender: UIRefreshControl) {
        print("refresh")
    }
}
```

## Xcode Preview

Xcode Previewによりビルドすることなくレイアウトを確認することができます

Xcode Preview allows you to check the layout without building

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
