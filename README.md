# DeclarativeUIKit

[![Swift](https://img.shields.io/badge/Swift-5-orange?style=flat-square)](https://img.shields.io/badge/Swift-5-Orange?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-iOS_-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-iOS_-yellowgreen?style=flat-square)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
[![Twitter](https://img.shields.io/badge/twitter-@sakiyamaK-blue.svg?style=flat-square)](https://twitter.com/sakiyamaK)

UIKitのAutolayoutを宣言的に記述するライブラリです

Library for writing UIKit Autolayout declaratively.


```swift
self.declarative {
  UIScrollView.vertical {
    UIStackView.vertical {
      UIView()
      UIButton()
      UILabel()
    }
  }
}
```

* [Installation](#installation)
  * [Swift Package Manager](#swift-package-manager)
  * [CocoaPods](#cocoapods)
* [Documentation](#documentation)
  * [English](#english)
  * [Japanese](#japanese)
* [Quick Start](#quick-start)
* [Xcode Preview](#xcode-preview)
* [Other Examples](#other-examples)

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

## Documentation

### [English](https://github.com/sakiyamaK/DeclarativeUIKit/blob/develop/Documentation/en/index.md)

### [Japanese](https://github.com/sakiyamaK/DeclarativeUIKit/blob/develop/Documentation/ja/index.md)


## Quick Start

```swift
import UIKit
import DeclarativeUIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        self.declarative {            
            UIScrollView.vertical {
                UIStackView.vertical {

                    UIView()
                      .imperative { view in
                          print("命令的に記述も可能")
                          view.tintColor = .black
                          view.isUserInteractionEnabled = true
                      }
                      .size(width: 100, height: 100)
                      .backgroundColor(.red)
                      .transform(.init(rotationAngle: 45.0 / 360 * Double.pi))
                      .cornerRadius(30, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMaxYCorner])
                      .border(color: .blue, width: 10)
                      .customSpacing(40)

                    UIButton()
                        .title("button", for: .normal)
                        .titleColor(.brown, for: .normal)
                        .add(target: self, for: .touchUpInside, { _ in
                            print("タッチアクション")
                        })

                    Array(1 ... 10).compactMap { num in
                        UILabel("\(num)番目のlabel")
                            .textColor(.black)
                            .textAlignment(.center)
                    }

                    UIView.spacer()
                }
                .spacing(20)
            }
        }
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

## Other Examples

* Demo Projects

  [All Demo Index](https://github.com/sakiyamaK/DeclarativeUIKit/tree/main/DeclarativeUIKitDemo)

  * Basic Samples
    
    基礎的な使い方のサンプルです

    Here is a sample of basic usage

    - [Index](https://github.com/sakiyamaK/DeclarativeUIKit/tree/main/DeclarativeUIKitDemo/DeclarativeUIKitDemo/Simple)

      - [SimpleViewController](https://github.com/sakiyamaK/DeclarativeUIKit/tree/main/DeclarativeUIKitDemo/DeclarativeUIKitDemo/Simple/SimpleViewController.swift)
      - [Simple2ViewController](https://github.com/sakiyamaK/DeclarativeUIKit/tree/main/DeclarativeUIKitDemo/DeclarativeUIKitDemo/Simple/Simple2ViewController.swift)

    _
    <img src="https://i.gyazo.com/620c480905f256485fd84b528f0cfcf6.png" width=300>

  * CollectionView
    
    UICollectionViewの基礎のサンプルです

    This is a sample of the basics of UICollectionView.

    - [Index](https://github.com/sakiyamaK/DeclarativeUIKit/tree/main/DeclarativeUIKitDemo/DeclarativeUIKitDemo/Collection)
      - [CollectionViewController](https://github.com/sakiyamaK/DeclarativeUIKit/tree/main/DeclarativeUIKitDemo/DeclarativeUIKitDemo/Collection/CollectionViewController.swift)

     _
    <img src="https://i.gyazo.com/804a05bb8263911cd38fcde91635a6dc.png" width=300>
    
  * MVP Architecture

    MVPアーキテクチャでGithub APIを実行するサンプルです

    This is a sample of running the Github API on the MVP architecture.

    - [Index](https://github.com/sakiyamaK/DeclarativeUIKit/tree/main/DeclarativeUIKitDemo/DeclarativeUIKitDemo/Github)
      - [GithubSearchCollectionViewController](https://github.com/sakiyamaK/DeclarativeUIKit/tree/main/DeclarativeUIKitDemo/DeclarativeUIKitDemo/Github/GithubSearch/GithubSearchCollectionViewController.swift)    
      - [GithubResultWebViewContrller](https://github.com/sakiyamaK/DeclarativeUIKit/tree/main/DeclarativeUIKitDemo/DeclarativeUIKitDemo/Github/GithubResultWeb/GithubResultWebViewContrller.swift)

    _
    <img src="https://i.gyazo.com/f56db1f88b943d4c3b32840adc9235d0.png" width=300>

  * Copy SwiftUI Tutorial Chapter 1
      
    [Apple公式のSwiftUIチュートリアルのChapter 1](https://developer.apple.com/tutorials/swiftui)を真似たサンプルです

    This is a sample that mimics [Chapter 1 of Apple's official SwiftUI tutorial](https://developer.apple.com/tutorials/swiftui).

    - [Index](https://github.com/sakiyamaK/DeclarativeUIKit/tree/main/DeclarativeUIKitDemo/DeclarativeUIKitDemo/CopyAppleSwiftUITutorial)
      - [LandmarkListViewController](https://github.com/sakiyamaK/DeclarativeUIKit/tree/main/DeclarativeUIKitDemo/DeclarativeUIKitDemo/CopyAppleSwiftUITutorial/LandmarkList/LandmarkListViewController.swift)
      - [LandmarkDetailViewController](https://github.com/sakiyamaK/DeclarativeUIKit/tree/main/DeclarativeUIKitDemo/DeclarativeUIKitDemo/CopyAppleSwiftUITutorial/LandmarkDetail/LandmarkDetailViewController.swift)

    _
    <img src="https://i.gyazo.com/02b4e0eca90a99d891575fc11af54e6b.png" width=300>
