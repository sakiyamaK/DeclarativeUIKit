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
| safeAreas | [UIEdgeBools](parameter.md#uIEdgeBools) | 上下左右のセーフエリア内にレイアウトを配置するか決めるパラメータ、`false`の場合はセーフエリア外までレイアウトを広げる |
| priorities | [UIEdgePriorities](parameter.md#uIEdgePriorities) | 上下左右の制約の優先度のパラメータ |
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
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = .white
            
            //宣言的にレイアウトを記述していく
            self.declarative {
                UIScrollView {
                    UIStackView { superview in
                        UIView.spacer().height(300).backgroundColor(.systemRed)
                        UIView.spacer().height(300).backgroundColor(.systemGreen)
                        UIView.spacer().height(300).backgroundColor(.systemBlue)
                    }
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