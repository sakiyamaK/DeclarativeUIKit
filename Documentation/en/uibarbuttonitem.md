# UIBarButtonItem

## initializer

```swift
    convenience init(barButtonSystemItem: SystemItem)

    convenience init(title: String?, style: Style, target: AnyObject?, actionBuilder: () -> Selector?)

    convenience init(title: String?, style: Style)
    
    convenience init(image: UIImage?, style: Style, target: AnyObject?, actionBuilder: () -> Selector?)
    
    convenience init(image: UIImage?, style: Style)
    
    convenience init(image: UIImage?, landscapeImagePhone: UIImage?, style: Style, target: Any?, actionBuilder: () -> Selector?)
    
    convenience init(image: UIImage?, landscapeImagePhone: UIImage?, style: Style)
    
    @available(iOS 16.0, *)
    convenience init(title: String?, image: UIImage?, target: AnyObject?, actionBuilder: () -> Selector?, menu: UIMenu?)
```


## function

### add action

```swift
    func action(_ actionBuilder: () -> Selector) -> Self

    func action(_ action: @escaping ((Any) -> Void)) -> Self

    func action(_ target: AnyObject?, _ action: @escaping ((Any) -> Void)) -> Self
```

### some default parameters

```swift
    func customView(_ customView: UIView) -> Self

    func primaryAction(_ primaryAction: UIAction?) -> Self

    func changesSelectionAsPrimaryAction(_ changesSelectionAsPrimaryAction: Bool) -> Self

    func action(_ action: Selector?) -> Self

    func target(_ target: AnyObject?) -> Self

    func style(_ style: UIBarButtonItem.Style) -> Self
    
    func tintColor(_ tintColor: UIColor?) -> Self
    
    func width(_ width: CGFloat) -> Self
    
    func possibleTitles(_ possibleTitles: Set<String>?) -> Self
    
    func backButtonBackgroundImage(_ backButtonBackgroundImage: UIImage?, for: UIControl.State, barMetrics: UIBarMetrics) -> Self
    
    func backButtonTitlePositionAdjustment(_ adjustment: UIOffset, for: UIBarMetrics) -> Self
    
    func backButtonBackgroundVerticalPositionAdjustment(_ adjustment: CGFloat, for: UIBarMetrics) -> Self
    
    func backgroundVerticalPositionAdjustment(_ adjustment: CGFloat, for: UIBarMetrics) -> Self
    
    func backgroundImage(_ backgroundImage: UIImage?, for: UIControl.State, barMetrics: UIBarMetrics) -> Self
    
    func backgroundImage(_ backgroundImage: UIImage?, for: UIControl.State, style: UIBarButtonItem.Style, barMetrics: UIBarMetrics) -> Self
    
    func titlePositionAdjustment(_ adjustment: UIOffset, for: UIBarMetrics) -> Self

  func isSelected(_ isSelected: Bool) -> Self

  @available(iOS 16.0, *)
  func menu(_ menu: UIMenu) -> Self

  @available(iOS 16.0, *)
  func preferredMenuElementOrder(_ preferredMenuElementOrder: UIContextMenuConfiguration.ElementOrder) -> Self
  
  @available(iOS 16.0, *)
  func isHidden(_ isHidden: Bool) -> Self

  @available(iOS 16.0, *)
  func menuRepresentation(_ menuRepresentation: UIMenuElement?) -> Self
```

#### sample

```swift
final class ViewController: UIViewController {
       
    override func loadView() {
        super.loadView()
        self.applyNavigationItem({
            $0.rightBarButtonItems = [
                UIBarButtonItem(barButtonSystemItem: .action)
                    .target(self)
                    .backgroundImage(UIImage(systemName: "trash"), for: .normal, barMetrics: .default)
                    .action({_ in
                        print("tap")
                    }),
                UIBarButtonItem()
                    .title("test1")
                    .style(.plain)
                    .target(self)
                    .tintColor(.brown)
                    .action({ _ in
                        print("tap2")
                    }),
            ]
        })
    }
```

