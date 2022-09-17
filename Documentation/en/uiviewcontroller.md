# UIViewController

## function

### declarative

Declaratively describe the UIView within the various builder parameters of the declarative.

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
| safeAreas | [UIEdgeBools](parameter.md#uiedgebools) | Parameter that determines whether the layout is placed within the top, bottom, left, and right safe areas; if `false`, the layout is extended outside the safe areas |
| priorities | [UIEdgePriorities](parameter.md#uiedgepriorities) | Parameter for priority of up/down and left/right constraints |
| outsideSafeAreaTopBuilder | () -> UIView? | Layout for outside of Safe Area Top |
| outsideSafeAreaLeadingBuilder | () -> UIView? | Layout for outside of Safe Area Leading |
| outsideSafeAreaBottomBuilder | () -> UIView? | Layout for outside of Safe Area Bottom |
| outsideSafeAreaTrailingBuilder | () -> UIView? | Layout for outside of Safe Area Trailing |
| builder | () -> UIView? | Main layout, `safeAreas` and `priorities` are adapted here |

#### Sample

Here is an example of setting `UIScrollView` in `MainViewController.swift`

```swift 
import UIKit
import DeclarativeUIKit

final class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
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

Here is an example of placing a layout outside the safe area.

```swift 
import UIKit
import DeclarativeUIKit

final class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //You can also set the safe area and priority
        //Layout can be built outside the safe area
        self.declarative(
            //The left and right sides extend the layout to outside the safe area.
            safeAreas: .init(top: true, leading: false, bottom: true, trailing: false),
            //Set the top, bottom, left and right constraints of the View to priority.
            priorities: .init(all: .required),
            outsideSafeAreaTop: {
                //set a layout outside the safe area on
                UIView.spacer().backgroundColor(.systemYellow)
            },
            outsideSafeAreaLeading: {
            },
            outsideSafeAreaBottom: {
                //set a layout outside the safe area down
                UIView.spacer().backgroundColor(.systemBlue)
            },
            outsideSafeAreaTrailing: {
            }
        ) {
            //set the layout of the main View
            UIStackView.vertical {
                UIView.spacer().backgroundColor(.systemRed)
            }
        }
    }
}
```