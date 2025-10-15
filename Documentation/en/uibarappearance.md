# UIBarAppearance

Available on `iOS 13.0` or later

## initializer

### init with parameters

Create an instance of UIBar specifying the type of background

```swift
init(configureBackgroundType: UIBarAppearanceconfigureBackgroundType)
```

#### sample
```swift
UITabBarAppearance(configureBackgroundType: .default)
```

## function

### some default parameters

The following standard parameters can be written declaratively

```swift
func apply(_ apply: ((Self) -> Void)) -> Self

func backgroundEffect(_ backgroundEffect: UIBlurEffect?) -> Self

func backgroundColor(_ backgroundColor: UIColor?) -> Self

func backgroundImage(_ backgroundImage: UIImage?) -> Self

func backgroundImageContentMode(_ backgroundImageContentMode: UIView.ContentMode) -> Self

func shadowColor(_ shadowColor: UIColor?) -> Self

func shadowImage(_ shadowImage: UIImage?) -> Self
```

### configure

Specify the type of UIBar background

```swift
func configure(_ backgroundType: UIBarAppearanceConfigureBackgroundType) -> Self
```

### tabBarAppearance

Sets the appearance specified by `appearanceTypes
If older than `iOS15`, `scrollEdgeAppearance` will not be set

```swift
func tabBarAppearance(appearanceTypes: [UITabBarAppearanceType] = UITabBarAppearanceType.allCases, _ appearanceBuilder: ((Self) -> UITabBarAppearance)) -> Self

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
