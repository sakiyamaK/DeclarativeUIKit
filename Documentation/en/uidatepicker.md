# UIDatePicker

## function

### some default parameters

The following standard parameters can be written declaratively.

```swift
func datePickerMode(_ datePickerMode: UIDatePicker.Mode) -> Self

func preferredDatePickerStyle(_ style: UIDatePickerStyle) -> Self

func date(_ date: Date, animated: Bool = false) -> Self

func minimumDate(_ minimumDate: Date?) -> Self

func maximumDate(_ maximumDate: Date?) -> Self

func minuteInterval(_ minuteInterval: Int) -> Self

func locale(_ locale: Locale?) -> Self

func calendar(_ calendar: Calendar) -> Self

func timeZone(_ timeZone: TimeZone?) -> Self

func roundsToMinuteInterval(_ roundsToMinuteInterval: Bool) -> Self
```

#### sample

```swift
self.declarative {
    UIDatePicker()
        .preferredDatePickerStyle(.wheels)
        .datePickerMode(.dateAndTime)
        .minimumDate(Date())
}
```
