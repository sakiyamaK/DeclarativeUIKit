# UIScrollView

## initilizer

### init with layout parameters

```swift
init(axis: NSLayoutConstraint.Axis, margin: UIEdgeInset, _ builder: () -> UIView)
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| axis | NSLayoutConstraint.Axis | スクロール方向を指定する、デフォルトは`vertical` |
| margin | UIEdgeInset | `builder`で生成されるViewを配置する際のマージン、デフォルトは`zero` |
| builder | () -> UIView | スクロールさせるview |

#### sample

```swift
import UIKit
import DeclarativeUIKit

final class MainViewController: UIViewController {
  override func loadView() {
    super.loadView()
    self.view.backgroundColor = .white
    
    self.declarative {
        UIScrollView(axis: .vertical, margin: .zero) {
            UIView.spacer()
                .backgroundColor(.blue)
                .height(1000)
        }
    }
  }
}
```

### init with vertical parameters

縦方向にスクロールするビューを生成します

```swift
static func vertical(margin: UIEdgeInsets, _ builder: () -> UIView) -> UIScrollView
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| margin | UIEdgeInset | `builder`で生成されるViewを配置する際のマージン、デフォルトは`zero` |
| builder | () -> UIView | スクロールさせるview |

#### sample

```swift
self.declarative {
    UIScrollView.vertical {
        UIView.spacer()
            .backgroundColor(.blue)
            .height(1000)
    }
}
```

### init with horizontal parameters

横方向にスクロールするビューを生成します

```swift
static func horizontal(margin: UIEdgeInsets, _ builder: () -> UIView) -> UIScrollView
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| margin | UIEdgeInset | `builder`で生成されるViewを配置する際のマージン、デフォルトは`zero` |
| builder | () -> UIView | スクロールさせるview |

#### sample

```swift
self.declarative {
    UIScrollView.horizontal {
        UIView.spacer()
            .backgroundColor(.blue)
            .width(1000)
    }
}
```

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます

```swift
func isScrollEnabled(_ isScrollEnabled: Bool) -> Self

func showsVerticalScrollIndicator(_ showsVerticalScrollIndicator: Bool) -> Self

func showsHorizontalScrollIndicator(_ showsHorizontalScrollIndicator: Bool) -> Self
```

#### sample

```swift
self.declarative {
    UIScrollView {
        UIView.spacer()
            .backgroundColor(.blue)
            .height(500)
    }
    .showsVerticalScrollIndicator(true)
    .showsHorizontalScrollIndicator(false)
    .isScrollEnabled(false)
}
```

### showsScrollIndicator

`showsVerticalScrollIndicator`と`showsHorizontalScrollIndicator`を同時に設定します

```swift
func showsScrollIndicator(_ showsScrollIndicator: Bool) -> Self
```

### refreshControl

`refreshControl`を宣言的に定義します

```swift
func refreshControl(_ refreshControl: () -> UIRefreshControl) -> Self
```

#### sample
```swift
self.declarative {
    UIScrollView { superview in
        UIView.spacer()
            .backgroundColor(.blue)
            .height(500)
    }
    .refreshControl {
        UIRefreshControl()
            .add(target: self, for: .valueChanged) {
                #selector(refresh)
            }
    }
}
```