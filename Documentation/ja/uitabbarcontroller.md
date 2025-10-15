# UITabBarController

## initializer

### init with parameters

初期化時に`viewControllers`を設定するパラメータ

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

以下の標準パラメータは宣言的に記述できます

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

`tabBar`の`standardAppearance`と`scrollEdgeAppearance`を同時に設定します
`iOS 15.0`より古い場合は`scrollEdgeAppearance`は設定されません

```swift
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