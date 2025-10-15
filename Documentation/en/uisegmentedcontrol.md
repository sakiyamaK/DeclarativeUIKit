# UISegmentedControl

## function

### some default parameters

The following standard parameters can be written declaratively.

```swift    
    func insertSegmentAction(_ action: UIAction, at segment: Int, animated: Bool = true) -> Self

    func action(_ action: UIAction, forSegmentAt segment: Int) -> Self

    func isMomentary(_ isMomentary: Bool) -> Self
    
    func apportionsSegmentWidthsByContent(_ apportionsSegmentWidthsByContent: Bool) -> Self
    
    func insertSegment(title: String?, at segment: Int, animated: Bool = true) -> Self

    func insertSegment(image: UIImage?, at segment: Int, animated: Bool = true) -> Self

    func remove(segment: Int, animated: Bool = true) -> Self

    func removeAll() -> Self

    func title(_ title: String?, forSegmentAt segment: Int) -> Self
    
    func image(_ image: UIImage?, forSegmentAt segment: Int) -> Self
    
    func width(_ width: CGFloat, forSegmentAt segment: Int) -> Self

    func contentOffset(_ contentOffset: CGSize, forSegmentAt segment: Int) -> Self
    
    func enabled(_ enabled: Bool, forSegmentAt segment: Int) -> Self
    
    func selectedSegmentIndex(_ selectedSegmentIndex: Int) -> Self
    
    func selectedSegmentTintColor(_ selectedSegmentTintColor: UIColor?) -> Self

    func backgroundImage(_ backgroundImage: UIImage?, for state: UIControl.State = .normal, barMetrics: UIBarMetrics = .default) -> Self
    
    func dividerImage(_ dividerImage: UIImage?, forLeftSegmentState leftState: UIControl.State = .normal, rightSegmentState rightState: UIControl.State = .normal, barMetrics: UIBarMetrics = .default) -> Self

    func titleTextAttributes(_ attributes: [NSAttributedString.Key : Any]?, for state: UIControl.State = .normal) -> Self
    
    func contentPositionAdjustment(_ adjustment: UIOffset, forSegmentType leftCenterRightOrAlone: UISegmentedControl.Segment, barMetrics: UIBarMetrics = .default) -> Self

```

#### sample

```swift
self.declarative {
  UIScrollView.horizontal {
      UISegmentedControl(
          items: ["offsetをずらすタイトル",
                  "あとで変更するタイトル",
                  UIAction(title: "action付きタイトル", handler: { _ in
                      print("action")
                  })
                  ]
      )
      .selectedSegmentIndex(0)
      .contentOffset(
          .init(
              width: -10,
              height: 0
          ),
          forSegmentAt: 0
      )
      .width(200, forSegmentAt: 0)
      .title("変更したタイトル", forSegmentAt: 1)
      .selectedSegmentTintColor(.systemBlue)
      .padding(insets: .init(all: 20))
      .top()
  }
}
```
