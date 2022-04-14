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
* [Documents](https://github.com/sakiyamaK/DeclarativeUIKit/blob/main/Documentation)
  * [Japanese](https://github.com/sakiyamaK/DeclarativeUIKit/blob/main/Documentation/ja/index.md)
* [Quick Start](#quick-start)
* [Xcode Preview](#xcode-preview)

## Motivation

UIKitのプロジェクトからSwiftUIに移行するためには根本の設計から変える必要がある場合があり、さらにUIKitからSwiftUIやSwiftUIからUIKitの相互の連携がどうしても必要になります。

またSwiftUIはCombineを用いたMVVM設計を基本とするため、それ以外のアーキテクチャを採用していたりリアクティブプログラミングの学習が十分でないプロジェクトの場合、導入の敷居が高くなります。

そのためUIKitをメインとして既存のレイアウトの定義だけを宣言的に記述できるライブラリとしました。

In order to migrate from a UIKit project to SwiftUI, it may be necessary to change the underlying design, and furthermore, the interworking of UIKit to SwiftUI and SwiftUI to UIKit is inevitable.

In addition, since SwiftUI is based on MVVM design using Combine, projects that use other architectures or have not sufficiently learned reactive programming will have a higher threshold for implementation.

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

## Quick Start

```swift
import UIKit
import DeclarativeUIKit

final class SimpleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        let ArrayViews = {
            Array(1 ... 10).compactMap { num in
                UILabel("\(num)番目のlabel")
                    .textColor(.black)
                    .textAlignment(.center)
            }
        }

        self.declarative {
            UIScrollView.vertical {
                UIStackView.vertical {

                    UIImageView(UIImage(systemName: "square.and.arrow.up"))
                        .contentMode(.scaleAspectFit)
                        .height(200)
                        .zStack(margin: .init(top: 70, left: 10, bottom: 0, right: 10)) {
                            UILabel("タップジェスチャーのあるラベル")
                                .textAlignment(.center)
                                .font(UIFont.boldSystemFont(ofSize: 20))
                                .isUserInteractionEnabled(true)
                                .addGestureRecognizer {
                                    UITapGestureRecognizer(target: self) {
                                        #selector(self.tapLabel(_:))
                                    }
                                }
                        }

                    UIButton()
                        .title("button", for: .normal)
                        .titleColor(.brown, for: .normal)
                        .addControlAction(target: self, for: .touchUpInside) {
                            #selector(self.tapButton)
                        }
                    
                    UIView.divider()

                    ArrayViews()

                    UIView.divider()

                    UIScrollView.horizontal(margin: .init(top: 20, left: 10, bottom: 20, right: 10)) {
                        
                        UIStackView.horizontal(distribution: .fill) { stackView in
                            UIView()
                                .imperative { _ in
                                    print(stackView)
                                }
                                .size(width: 100, height: 100)
                                .backgroundColor(.red)
                                .transform(.init(rotationAngle: 45.0 / 360 * Double.pi))
                                .cornerRadius(30, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMaxYCorner])
                                .border(color: .blue, width: 10)
                                .customSpacing(40)

                            UIView.imperative {
                                print(stackView)
                                $0.heightConstraint = 100
                                $0.widthConstraint = 100
                                $0.backgroundColor = .systemBlue
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

                    UIView.spacer()
                }
                .spacing(20)
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
