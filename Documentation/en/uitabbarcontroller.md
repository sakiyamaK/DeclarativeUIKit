# UITabBarController

## initializer

### init with parameters

Parameters to set `viewControllers` at initialization

```swift
static func viewControllers(_ viewControllers: [UIViewController]) -> UITabBarController

static func viewControllers(@ArrayUIViewControllerBuilder _ builder: () -> [UIViewController]) -> UITabBarController
```

#### sample
```swift
UITabBarController.viewControllers {
    UIViewController().tabBarItem(
        UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
    )
    UIViewController().tabBarItem(
        UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
    )
}
```

## function

### some default parameters

The following standard parameters can be written declaratively

```swift
func viewControllers(_ viewControllers: [UIViewController]) -> Self

func viewControllers(@ArrayUIViewControllerBuilder _ builder: () -> [UIViewController]) -> Self

func viewControllers(_ viewControllers: [UIViewController]?, animated: Bool) -> Self

func viewControllers(@ArrayUIViewControllerBuilder _ builder: () -> [UIViewController], animated: Bool) -> Self

func viewControllers(animated: Bool, _ viewControllers: [UIViewController]?) -> Self

func viewControllers(animated: Bool, @ArrayUIViewControllerBuilder _ builder: () -> [UIViewController]) -> Self

func selectedViewController(_ selectedViewController: UIViewController?) -> Self

func selectedIndex(_ selectedIndex: Int) -> Self

func customizableViewControllers(_ customizableViewControllers: [UIViewController]?) -> Self

func customizableViewControllers(@ArrayUIViewControllerBuilder _ builder: () -> [UIViewController]) -> Self

func delegate(_ delegate: UITabBarControllerDelegate?) -> Self
```

### tabBarAppearance

Set `standardAppearance` and `scrollEdgeAppearance` of `tabBar` at the same time
If older than `iOS 15.0`, `scrollEdgeAppearance` will not be set.

```swift
@available(iOS 13.0, *)
func tabBarAppearance(appearanceTypes: [UITabBarAppearanceType] = UITabBarAppearanceType.allCases, _ tabBarAppearanceBuilder: (() -> UITabBarAppearance)) -> Self
```

#### sample

```swift
UITabBarController.viewControllers {
    UIViewController().tabBarItem(
        UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
    )
    UIViewController().tabBarItem(
        UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
    )
}
.tabBarAppearance {
    UITabBarAppearance(configureBackgroundType: .default)
        .backgroundColor(.blue)
        .tabBarItemAppearance {
            UITabBarItemAppearance()
                .iconColor(.green, appearanceTypes: [.normal])
                .iconColor(.yellow, appearanceTypes: [.selected])
                .titleTextAttributes([.foregroundColor: UIColor.red, .backgroundColor: UIColor.white])
                .badgeBackgroundColor(.brown)
        }
}
```