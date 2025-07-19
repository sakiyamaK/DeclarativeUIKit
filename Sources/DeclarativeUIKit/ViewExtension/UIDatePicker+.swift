
import UIKit.UIDatePicker

public extension UIDatePicker {
    
    @discardableResult
    func datePickerMode(_ datePickerMode: UIDatePicker.Mode) -> Self {
        self.datePickerMode = datePickerMode
        return self
    }

    @available(iOS 13.4, *)
    @discardableResult
    func preferredDatePickerStyle(_ style: UIDatePickerStyle) -> Self {
        self.preferredDatePickerStyle = style
        return self
    }

    @discardableResult
    func date(_ date: Date, animated: Bool = false) -> Self {
        self.setDate(date, animated: animated)
        return self
    }

    @discardableResult
    func minimumDate(_ minimumDate: Date?) -> Self {
        self.minimumDate = minimumDate
        return self
    }

    @discardableResult
    func maximumDate(_ maximumDate: Date?) -> Self {
        self.maximumDate = maximumDate
        return self
    }

    @discardableResult
    func minuteInterval(_ minuteInterval: Int) -> Self {
        self.minuteInterval = minuteInterval
        return self
    }
    
    @discardableResult
    func locale(_ locale: Locale?) -> Self {
        self.locale = locale
        return self
    }
    
    @discardableResult
    func calendar(_ calendar: Calendar) -> Self {
        self.calendar = calendar
        return self
    }
    
    @discardableResult
    func timeZone(_ timeZone: TimeZone?) -> Self {
        self.timeZone = timeZone
        return self
    }

    @available(iOS 15.0, *)
    @discardableResult
    func roundsToMinuteInterval(_ roundsToMinuteInterval: Bool) -> Self {
        self.roundsToMinuteInterval = roundsToMinuteInterval
        return self
    }
}
