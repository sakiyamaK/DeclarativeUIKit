# UIDatePicker

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます

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
