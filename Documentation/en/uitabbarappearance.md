# UITabBarAppearance

Available on `iOS 13.0` or later

## function

### some default parameters

The following standard parameters can be written declaratively

```swift
func stackedLayoutAppearance(_ stackedLayoutAppearance: UITabBarItemAppearance) -> Self

func inlineLayoutAppearance(_ inlineLayoutAppearance: UITabBarItemAppearance) -> Self

func compactInlineLayoutAppearance(_ compactInlineLayoutAppearance: UITabBarItemAppearance) -> Self

func selectionIndicatorTintColor(_ selectionIndicatorTintColor: UIColor?) -> Self

func selectionIndicatorImage(_ selectionIndicatorImage: UIImage?) -> Self

func stackedItemPositioning(_ stackedItemPositioning: UITabBar.ItemPositioning) -> Self

func stackedItemWidth(_ stackedItemWidth: CGFloat) -> Self

func stackedItemSpacing(_ stackedItemSpacing: CGFloat) -> Self
```

### tabBarItemAppearance(appearanceTypes: , _ layoutAppearanceBuilder: )

Set `stackedLayoutAppearance`, `inlineLayoutAppearance`, and `compactInlineLayoutAppearance` simultaneously.

```swift
func tabBarItemAppearance(appearanceTypes: [UITabBarItemAppearanceType] = UITabBarItemAppearanceType.allCases, _ layoutAppearanceBuilder: (() -> UITabBarItemAppearance)) -> Self
```

#### sample

```swift
UITabBarAppearance().tabBarItemAppearance(appearanceTypes: [.stackedLayoutAppearance, .inlineLayoutAppearance]) {
    UITabBarItemAppearance()
        .iconColor(.green, appearanceTypes: [.normal])
        .iconColor(.yellow, appearanceTypes: [.selected])
        .titleTextAttributes([.foregroundColor: UIColor.red, .backgroundColor: UIColor.white])
        .badgeBackgroundColor(.brown)
}
```