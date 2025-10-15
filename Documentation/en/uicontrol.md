# UIControl

## initializer

### init with primaryAction

```swift
convenience init(primaryAction: UIAction?)
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| primaryAction | UIAction? | The primary action for the control. |

### init with primaryActionHandler

```swift
convenience init(primaryActionHandler: @escaping UIActionHandler)
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| primaryActionHandler | UIActionHandler | The closure to be executed as the primary action. |

## function

### some default parameters

The following standard parameters can be written declaratively.

```swift
func isEnabled(_ isEnabled: Bool) -> Self

func isSelected(_ isSelected: Bool) -> Self

func isHighlighted(_ isHighlighted: Bool) -> Self

func contentVerticalAlignment(_ contentVerticalAlignment: UIControl.ContentVerticalAlignment) -> Self

func contentHorizontalAlignment(_ contentHorizontalAlignment: UIControl.ContentHorizontalAlignment) -> Self

func isContextMenuInteractionEnabled(_ isContextMenuInteractionEnabled: Bool) -> Self

func showsMenuAsPrimaryAction(_ showsMenuAsPrimaryAction: Bool) -> Self

func toolTip(_ toolTip: String?) -> Self

@available(iOS 17.0, *)
func isSymbolAnimationEnabled(_ isSymbolAnimationEnabled: Bool) -> Self
```

### add target action

```swift
@available(iOS, deprecated: 14.0, message: "This function is deprecated. Use addAction instead")
func add(target: Any?, action: Selector, for controlEvents: UIControl.Event) -> Self

@available(iOS, deprecated: 14.0, message: "This function is deprecated. Use addAction instead")
func add(target: Any?, for controlEvents: UIControl.Event, _ actionBuilder: () -> Selector) -> Self

@available(iOS, deprecated: 14.0, message: "This function is deprecated. Use addAction instead")
func addControlAction(target: Any?, for controlEvents: UIControl.Event, _ actionBuilder: () -> Selector) -> Self

@available(iOS, deprecated: 14.0, message: "This function is deprecated. Use addAction instead")
func add(target: Any, for controlEvents: UIControl.Event, _ action: @escaping ((Any) -> Void)) -> Self

func addAction(_ controlEvents: UIControl.Event, handler: @escaping UIActionHandler) -> Self
```

#### sample

```swift
self.declarative {
    UIStackView.vertical {
        if #available(iOS 14.0, *) {
          UIButton("tap")
            .addAction(.touchUpInside) { [weak self] action in
              print(action)
            }
        }
    }.alignment(.center)
}
```
