import UIKit

@available(iOS 16.0, *)
public extension UICalendarView {

    @discardableResult
    func calendar(_ calendar: Calendar) -> Self {
        self.calendar = calendar
        return self
    }

    @discardableResult
    func locale(_ locale: Locale) -> Self {
        self.locale = locale
        return self
    }

    @discardableResult
    func timeZone(_ timeZone: TimeZone?) -> Self {
        self.timeZone = timeZone
        return self
    }

    @discardableResult
    func fontDesign(_ fontDesign: UIFontDescriptor.SystemDesign) -> Self {
        self.fontDesign = fontDesign
        return self
    }

    @discardableResult
    func visibleDateComponents(_ visibleDateComponents: DateComponents) -> Self {
        self.visibleDateComponents = visibleDateComponents
        return self
    }

    @discardableResult
    func availableDateRange(_ availableDateRange: DateInterval) -> Self {
        self.availableDateRange = availableDateRange
        return self
    }

    @discardableResult
    func wantsDateDecorations(_ wantsDateDecorations: Bool) -> Self {
        self.wantsDateDecorations = wantsDateDecorations
        return self
    }

    @discardableResult
    func delegate(_ delegate: UICalendarViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }

    @discardableResult
    func selectionBehavior(_ selectionBehavior: UICalendarSelection?) -> Self {
        self.selectionBehavior = selectionBehavior
        return self
    }
}
