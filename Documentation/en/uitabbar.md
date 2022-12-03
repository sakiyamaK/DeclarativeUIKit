# UITabBar

## function

### some default parameters

The following standard parameters can be written declaratively

```swift
func delegate(_ delegate: UITabBarDelegate?) -> Self

func items(_ items: [UITabBarItem]?) -> Self

func selectedItem(_ selectedItem: UITabBarItem?) -> Self

func items(_ items: [UITabBarItem]?, animated: Bool) -> Self

func tintColor(_ tintColor: UIColor) -> Self

func barTintColor(_ barTintColor: UIColor?) -> Self

func unselectedItemTintColor(_ unselectedItemTintColor: UIColor?) -> Self

func backgroundImage(_ backgroundImage: UIImage?) -> Self

func selectionIndicatorImage(_ selectionIndicatorImage: UIImage?) -> Self

func shadowImage(_ shadowImage: UIImage?) -> Self

func itemPositioning(_ itemPositioning: UITabBar.ItemPositioning) -> Self

func itemWidth(_ itemWidth: CGFloat) -> Self

func itemSpacing(_ itemSpacing: CGFloat) -> Self

func barStyle(_ barStyle: UIBarStyle) -> Self

func isTranslucent(_ isTranslucent: Bool) -> Self

@available(iOS 13.0, *)
func standardAppearance(_ standardAppearance: UITabBarAppearance) -> Self

@available(iOS 15.0, *)
func scrollEdgeAppearance(_ scrollEdgeAppearance: UITabBarAppearance?) -> Self
```

### tabBarAppearance(standard:, scrollEdge:)

Set `standardAppearance` and `scrollEdgeAppearance` at the same time
If older than `iOS 15.0`, `scrollEdgeAppearance` will not be set.

```swift
@available(iOS 13.0, *)
func tabBarAppearance(standard: UITabBarAppearance, scrollEdge: UITabBarAppearance?) -> Self
```

### tabBarAppearance(apperanceTypes:, apperanceBuilder:)

Sets the appearance specified by `appearanceTypes
If older than `iOS 15.0`, `scrollEdgeAppearance` will not be set.

```swift
@available(iOS 13.0, *)
func tabBarAppearance(appearanceTypes: [UITabBarAppearanceType] = UITabBarAppearanceType.allCases, _ appearanceBuilder: ((Self) -> UITabBarAppearance)) -> Self

@available(iOS 13.0, *)
func tabBarAppearance(appearanceTypes: [UITabBarAppearanceType] = UITabBarAppearanceType.allCases, _ appearanceBuilder: (() -> UITabBarAppearance)) -> Self
```

#### sample

```swift
UITabBar.appearance().tabBarAppearance(appearanceTypes: UITabBarAppearanceType.allCases) {
    UITabBarAppearance().tabBarItemAppearance(appearanceTypes: UITabBarItemAppearanceType.allCases) {
        UITabBarItemAppearance()
            .iconColor(.green, appearanceTypes: [.normal])
            .iconColor(.yellow, appearanceTypes: [.selected])
            .titleTextAttributes([.foregroundColor: UIColor.red, .backgroundColor: UIColor.white])
            .badgeBackgroundColor(.brown)
    }
}
```