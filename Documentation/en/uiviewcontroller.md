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

### apply

Methods to procedurally implement `UIViewController` parameters as standard

```swift
func apply(_ closure: ((Self) -> Void)) -> Self
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| apply | ((Self) -> Void) | Write parameters procedurally internally by passing themselves as arguments |


#### sample
```swift
UIViewController().imperative {
  $0.view.backgroundColor = .white
  $0.declarative {
      UILabel(number.description)
          .center()
  }
```

### tabBarItem

Declaratively describe `tabBarItem` in `UIViewController`.

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

```swift
func present(from: UIViewController, animated: Bool, completion: (() -> Void)? = nil) -> Self
```

#### sample

```swift
UIViewController().declarative {
  UIStackView.vertical {
    UILabel("Screen after transition")
      .center()
  }
}.present(from: self, animated: true) {
  print("Screen transition has occurred.")
}
```

### applyView

Declaratively describe the `view` parameter of `UIViewController

```swift
func applyView(_ configure: ((UIView) -> Void)) -> Self
```

#### sample
```swift
UIViewController()
  .applyView {
    // view.background = .white
    $0.backgroundColor(.white)
  }
  .declarative {
    UIStackView.vertical {
      UILabel("layout")
        .center()
    }
  }
```

### applyNavigationItem

Declaratively describe the `navigationItem` parameter of `UIViewController

```swift
func applyNavigationItem(_ configure: ((UINavigationItem) -> Void)) -> Self
```

#### sample
```swift
        self.applyView {
            $0.backgroundColor(.white)
        }
        .applyNavigationItem({
            // navigationItem.rightBarButtonItems
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
            UILabel("layou")
                .center()
        }

```

### applySheetPresentationController

Declaratively describe the parameters of `UIViewController`'s `sheetPresentationController`.

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

Declaratively describes the FloatingActionView.

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
