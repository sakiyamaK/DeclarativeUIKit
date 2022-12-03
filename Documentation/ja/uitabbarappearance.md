# UITabBarAppearance

`iOS 13.0`以降で利用可能です

## function

### some default parameters


以下の標準パラメータは宣言的に記述できます


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

`stackedLayoutAppearance`, `inlineLayoutAppearance`, `compactInlineLayoutAppearance`を同時に設定します

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