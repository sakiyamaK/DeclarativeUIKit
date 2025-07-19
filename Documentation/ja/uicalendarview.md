# UICalendarView

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます。

```swift
@available(iOS 16.0, *)
func calendar(_ calendar: Calendar) -> Self

@available(iOS 16.0, *)
func locale(_ locale: Locale) -> Self

@available(iOS 16.0, *)
func timeZone(_ timeZone: TimeZone?) -> Self

@available(iOS 16.0, *)
func fontDesign(_ fontDesign: UIFontDescriptor.SystemDesign) -> Self

@available(iOS 16.0, *)
func visibleDateComponents(_ visibleDateComponents: DateComponents) -> Self

@available(iOS 16.0, *)
func availableDateRange(_ availableDateRange: DateInterval) -> Self

@available(iOS 16.0, *)
func wantsDateDecorations(_ wantsDateDecorations: Bool) -> Self

@available(iOS 16.0, *)
func delegate(_ delegate: UICalendarViewDelegate?) -> Self

@available(iOS 16.0, *)
func selectionBehavior(_ selectionBehavior: UICalendarSelection?) -> Self
```

#### sample

```swift
self.declarative {
    UICalendarView()
        .calendar(Calendar(identifier: .gregorian))
        .locale(Locale.current)
        .fontDesign(.rounded)
        .availableDateRange(DateInterval(start: Date(), end: Calendar.current.date(byAdding: .year, value: 1, to: Date())!))
        .delegate(self)
        .selectionBehavior(UICalendarSelectionSingleDate(delegate: self))
}
```
