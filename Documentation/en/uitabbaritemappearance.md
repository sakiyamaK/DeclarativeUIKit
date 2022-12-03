# UITabBarItemAppearance

Available on `iOS 13.0` or later

## initializer

### init with parameters

Parameter to set `configureWithDefault(for:)` at initialization

```swift
init(configureWithDefaultFor: UITabBarItemAppearance.Style)
```

## function

### configure(_ defaultFor:)

You can set the value of `configureWithDefault(for: )` declaratively

```swift
func configure(_ defaultFor: UITabBarItemAppearance.Style) -> Self
```

### some item states default parameters

The following parameters can declaratively set the `UITabBarItemAppearance` parameters `normal`, `disabled`, `focused` and `selected`.

```swift
func titleTextAttributes(_ titleTextAttributes: [NSAttributedString.Key : Any], appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self

func titleTextAttributes(_ titleTextAttributesBuilder: @escaping (() -> [NSAttributedString.Key : Any]), appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self

func titleTextAttributes(appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases, _ titleTextAttributesBuilder: @escaping (() -> [NSAttributedString.Key : Any])) -> Self

func titlePositionAdjustment(_ titlePositionAdjustment: UIOffset, appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self

func titlePositionAdjustment(_ titlePositionAdjustmentBuilder: (() -> UIOffset), appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self

func titlePositionAdjustment(appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases, _ titlePositionAdjustmentBuilder: (() -> UIOffset)) -> Self

func iconColor(_ iconColor: UIColor?, appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self

func iconColor(_ iconColorBuilder: (() -> UIColor?), appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self

func iconColor(appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases, _ iconColorBuilder: (() -> UIColor?)) -> Self

func badgePositionAdjustment(_ badgePositionAdjustment: UIOffset, appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self

func badgePositionAdjustment(_ badgePositionAdjustmentBuilder: (() -> UIOffset), appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self

func badgePositionAdjustment(appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases, _ badgePositionAdjustmentBuilder: (() -> UIOffset)) -> Self

func badgeBackgroundColor(_ badgeBackgroundColor: UIColor?, appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self

func badgeBackgroundColor(_ badgeBackgroundColorBuilder: (() -> UIColor?), appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self

func badgeBackgroundColor(appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases, _ badgeBackgroundColorBuilder: (() -> UIColor?)) -> Self

func badgeTextAttributes(_ badgeTextAttributes: [NSAttributedString.Key : Any], appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self

func badgeTextAttributes(_ badgeTextAttributesBuilder: (() -> [NSAttributedString.Key : Any]), appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self

func badgeTextAttributes(appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases, _ badgeTextAttributesBuilder: (() -> [NSAttributedString.Key : Any])) -> Self

func badgeTitlePositionAdjustment(_ badgeTitlePositionAdjustment: UIOffset, appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self

func badgeTitlePositionAdjustment(_ badgeTitlePositionAdjustmentBuilder: (() -> UIOffset), appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases) -> Self

func badgeTitlePositionAdjustment(appearanceTypes: [UITabBarItemStateAppearanceType] = UITabBarItemStateAppearanceType.allCases, _ badgeTitlePositionAdjustmentBuilder: (() -> UIOffset)) -> Self
```

### sample

```swift
UITabBarItemAppearance(configureWithDefaultFor: .compactInline)
    .iconColor(.green, appearanceTypes: [.normal])
    .iconColor(.yellow, appearanceTypes: [.selected])
    .titleTextAttributes([.foregroundColor: UIColor.red, .backgroundColor: UIColor.white])
    .badgeBackgroundColor(.brown)
```