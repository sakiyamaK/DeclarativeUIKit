# UIViewController

## function

### declarative

declarativeの各種builderパラメータ内でUIViewを宣言的に記述します

```swift
   func declarative(
        safeAreas: UIEdgeBools,
        priorities: UIEdgePriorities,
        @SingleUIViewBuilder outsideSafeAreaTop outsideSafeAreaTopBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaLeading outsideSafeAreaLeadingBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaBottom outsideSafeAreaBottomBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaTrailing outsideSafeAreaTrailingBuilder: () -> UIView?,
        @SingleUIViewBuilder _ builder: () -> UIView
    )
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| safeAreas | [UIEdgeBools](parameter.md#uiedgebools) | 上下左右のセーフエリア内にレイアウトを配置するか決めるパラメータ、`false`の場合はセーフエリア外までレイアウトを広げる |
| priorities | [UIEdgePriorities](parameter.md#uiedgepriorities) | 上下左右の制約の優先度のパラメータ |
| outsideSafeAreaTopBuilder | () -> UIView? | セーフエリアのTopの外側に対するレイアウト |
| outsideSafeAreaLeadingBuilder | () -> UIView? | セーフエリアのLeadingの外側に対するレイアウト |
| outsideSafeAreaBottomBuilder | () -> UIView? | セーフエリアのBottomの外側に対するレイアウト |
| outsideSafeAreaTrailingBuilder | () -> UIView? | セーフエリアのTrailingの外側に対するレイアウト |
| builder | () -> UIView? | メインのレイアウト、`safeAreas`と`priorities`はここに適応される |

#### Sample

`MainViewController.swift`で`UIScrollView`を設定する例です

```swift 
import UIKit
import DeclarativeUIKit

final class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        //宣言的にレイアウトを記述していく
        self.declarative {
            UIScrollView {
                UIStackView.vertical {
                    UIView.spacer().height(300).backgroundColor(.systemRed)
                    UIView.spacer().height(300).backgroundColor(.systemGreen)
                    UIView.spacer().height(300).backgroundColor(.systemBlue)
                }
            }
        }
    }
}
```

セーフエリア外にレイアウトを配置する例です

```swift 
import UIKit
import DeclarativeUIKit

final class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //セーフエリアの設定やpriorityもできます
        //セーフエリア外にレイアウトを組むこともできます
        //You can also set the safe area and priority
        //Layout can be built outside the safe area
        self.declarative(
            //左右はセーフエリア外までレイアウトを広げる
            //The left and right sides extend the layout to outside the safe area.
            safeAreas: .init(top: true, leading: false, bottom: true, trailing: false),
            //Viewの上下左右の制約をpriorityにする
            //Set the top, bottom, left and right constraints of the View to priority.
            priorities: .init(all: .required),
            outsideSafeAreaTop: {
                //上のセーフエリア外のレイアウトを組む
                //set a layout outside the safe area on
                UIView.spacer().backgroundColor(.systemYellow)
            },
            outsideSafeAreaLeading: {
            },
            outsideSafeAreaBottom: {
                //下のセーフエリア外のレイアウトを組む
                //set a layout outside the safe area down
                UIView.spacer().backgroundColor(.systemBlue)
            },
            outsideSafeAreaTrailing: {
            }
        ) {
            //メインのViewのレイアウトを組む
            //set the layout of the main View
            UIStackView.vertical {
                UIView.spacer().backgroundColor(.systemRed)
            }
        }
    }
}
```

### apply

`UIViewController`のパラメータを標準の通り手続的に実装するメソッドです

```swift
func apply(_ closure: ((Self) -> Void)) -> Self
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| apply | ((Self) -> Void) | 自身を引数として渡すことで内部で手続き的にパラメータを記述する |


#### sample
```swift
UIViewController().apply {
  $0.view.backgroundColor = .white
  $0.declarative {
      UILabel(number.description)
          .center()
  }
```

### tabBarItem

`UIViewController`の`tabBarItem`を宣言的に記述します

```swift
func tabBarItem(_ tabBarItem: UITabBarItem) -> Self

func tabBarItem(_ tabBarItemBuilder: (() -> UITabBarItem)) -> Self
```

#### sample

```swift
UIViewController()
  .tabBarItem {
    UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
  }
```

### present

呼び出される`UIViewController`から画面遷移するメソッドを宣言的に記述します

```swift
func present(from: UIViewController, animated: Bool, completion: (() -> Void)? = nil) -> Self
```

#### sample

```swift
UIViewController().declarative {
  UIStackView.vertical {
    UILabel("遷移後の画面")
      .center()
  }
}.present(from: self, animated: true) {
  print("画面遷移しました")
}
```

### applyView

`UIViewController`がもつ`view`のパラメータを宣言的に記述します

```swift
func applyView(_ configure: ((UIView) -> Void)) -> Self
```

#### sample
```swift
UIViewController()
  .applyView {
    // 背景を白にする
    $0.backgroundColor(.white)
  }
  .declarative {
    UIStackView.vertical {
      UILabel("レイアウトを組みます")
        .center()
    }
  }
```

### applyNavigationItem

`UIViewController`がもつ`navigationItem`のパラメータを宣言的に記述します

```swift
func applyNavigationItem(_ configure: ((UINavigationItem) -> Void)) -> Self
```

#### sample
```swift
        self.applyView {
            $0.backgroundColor(.white)
        }
        .applyNavigationItem({
            //navigationItemのrightBarButtonItemsを設定する
            $0.rightBarButtonItems = [
                UIBarButtonItem(barButtonSystemItem: .action)
                    .target(self)
                    .backgroundImage(UIImage(systemName: "trash"), for: .normal, barMetrics: .default)
                    .action({_ in
                        print("tap1")
                    }),
                UIBarButtonItem()
                    .title("test")
                    .style(.plain)
                    .target(self)
                    .tintColor(.brown)
                    .action({ _ in
                        print("tap2")
                    }),
            ]
        })
        .declarative {
            UILabel("レイアウトを組みます")
                .center()
        }

```

### applySheetPresentationController

`UIViewController`がもつ`sheetPresentationController`のパラメータを宣言的に記述します

```swift
@available(iOS 15.0, *)
func applySheetPresentationController(_ configure: ((UISheetPresentationController) -> Self
```

#### sample
```swift
UIViewController()
  .declarative {
    UIStackView.vertical {
        (0...50).compactMap { idx in
            UILabel("\(idx)")
                .textAlignment(.center)
                .contentPriorities(.init(vertical: .required))
                .customSpacing(8)
        }
    }
  }
  .applySheetPresentationController {
      $0.detents([.large(), .medium()])
          .preferredCornerRadius(16)
          .prefersGrabberVisible(true)
          .prefersScrollingExpandsWhenScrolledToEdge(false)
          .largestUndimmedDetentIdentifier(.large)
  }
  .present(from: self, animated: true)
```

### floatingActionView

`FloatingActionView`を宣言的に記述します

```swift
@available(iOS 15.0, *)
@discardableResult
func floatingActionView(
    layoutGuides: UIEdgeLayoutGuides = .init(all: .safeArea),
    position: FloatingActionViewPosition = .trailingBottom(CGPoint(x: 16, y: 16)),
    @SingleUIViewBuilder _ builder: @escaping () -> UIView
) -> Self
```

#### sample
```swift
        self.applyView {
            $0.backgroundColor(.white)
        }.floatingActionView {
            UIButton(
                configuration:
                        .bordered()
                        .image(UIImage(systemName: "plus"))
                        .cornerStyle(.capsule)
                        .buttonSize(.large)
            )
        }.floatingActionView(position: .centerTop(CGPoint(x: 30, y: 30))) {
            UIStackView.vertical(spacing: 16) {
                UILabel("label")
                UILabel("label")
                UILabel("label")
            }
        }
```
