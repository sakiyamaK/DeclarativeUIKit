# UITabBarItem

## function

### some default parameters

The following standard parameters can be written declaratively

```swift
func selectedImage(_ selectedImage: UIImage?) -> Self

func badgeValue(_ badgeValue: String?) -> Self

func titlePositionAdjustment(_ titlePositionAdjustment: UIOffset) -> Self

func badgeColor(_ badgeColor: UIColor?) -> Self

func badgeTextAttributes(_ textAttributes: [NSAttributedString.Key : Any]?, for state: UIControl.State = .normal) -> Self

func badgeTextAttributes(_ textAttributesBuilder: (() -> [NSAttributedString.Key : Any]?), for state: UIControl.State = .normal) -> Self

func badgeTextAttributes(for state: UIControl.State = .normal, _ textAttributesBuilder: (() -> [NSAttributedString.Key : Any]?)) -> Self

func standardAppearance(_ standardAppearance: UITabBarAppearance?) -> Self

func scrollEdgeAppearance(_ scrollEdgeAppearance: UITabBarAppearance?) -> Self
```

### appearance

Set `standardAppearance` and `scrollEdgeAppearance` at the same time
If older than `iOS 15.0`, `scrollEdgeAppearance` will not be set.

```swift
func appearance(appearanceTypes: [UITabBarAppearanceType] = UITabBarAppearanceType.allCases, _ appearanceBuilder: ((Self) -> UITabBarAppearance)) -> Self
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
