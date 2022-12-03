# UITabBarItem

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます

```swift
func selectedImage(_ selectedImage: UIImage?) -> Self

func badgeValue(_ badgeValue: String?) -> Self

func titlePositionAdjustment(_ titlePositionAdjustment: UIOffset) -> Self

func badgeColor(_ badgeColor: UIColor?) -> Self

func badgeTextAttributes(_ textAttributes: [NSAttributedString.Key : Any]?, for state: UIControl.State = .normal) -> Self

func badgeTextAttributes(_ textAttributesBuilder: (() -> [NSAttributedString.Key : Any]?), for state: UIControl.State = .normal) -> Self

func badgeTextAttributes(for state: UIControl.State = .normal, _ textAttributesBuilder: (() -> [NSAttributedString.Key : Any]?)) -> Self

@available(iOS 13.0, *)
func standardAppearance(_ standardAppearance: UITabBarAppearance?) -> Self

@available(iOS 15.0, *)
func scrollEdgeAppearance(_ scrollEdgeAppearance: UITabBarAppearance?) -> Self
```

### appearance

`standardAppearance`と`scrollEdgeAppearance`を同時に設定します
`iOS 15.0`より古い場合は`scrollEdgeAppearance`は設定されません

```swift
@available(iOS 13.0, *)
func appearance(appearanceTypes: [UITabBarAppearanceType] = UITabBarAppearanceType.allCases, _ appearanceBuilder: ((Self) -> UITabBarAppearance)) -> Self
@available(iOS 13.0, *)
func appearance(appearanceTypes: [UITabBarAppearanceType] = UITabBarAppearanceType.allCases, _ appearanceBuilder: (() -> UITabBarAppearance)) -> Self
```

#### sample

```swift
UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
    .appearance(appearanceTypes: UITabBarAppearanceType.allCases) {
        UITabBarAppearance().tabBarItemAppearance(appearanceTypes: UITabBarItemAppearanceType.allCases) {
            UITabBarItemAppearance()
                .iconColor(.red , appearanceTypes: [.normal])
                .iconColor(.yellow, appearanceTypes: [.selected])
                .titleTextAttributes([.foregroundColor: UIColor.red, .backgroundColor: UIColor.white])
                .badgeBackgroundColor(.brown)
        }
    }
}
```