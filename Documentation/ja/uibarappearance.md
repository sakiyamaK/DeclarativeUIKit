# UIBarAppearance

`iOS 13.0`以降で利用可能です

## initializer

### init with parameters

UIBarの背景の種類を指定してインスタンスを生成します

```swift
init(configureBackgroundType: UIBarAppearanceconfigureBackgroundType)
```

#### sample
```swift
UITabBarAppearance(configureBackgroundType: .default)
```

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます

```swift
func imperative(_ imperative: ((Self) -> Void)) -> Self

func backgroundEffect(_ backgroundEffect: UIBlurEffect?) -> Self

func backgroundColor(_ backgroundColor: UIColor?) -> Self

func backgroundImage(_ backgroundImage: UIImage?) -> Self

func backgroundImageContentMode(_ backgroundImageContentMode: UIView.ContentMode) -> Self

func shadowColor(_ shadowColor: UIColor?) -> Self

func shadowImage(_ shadowImage: UIImage?) -> Self
```

### configure

UIBarの背景の種類を指定する

```swift
func configure(_ backgroundType: UIBarAppearanceConfigureBackgroundType) -> Self
```

### tabBarAppearance

`appearanceTypes`で指定したappearanceを設定します
`iOS15`より古い場合は`scrollEdgeAppearance`は設定されません

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