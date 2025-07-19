import UIKit
import DeclarativeUIKit

@available(iOS 16.0, *)
final class CalendarViewController: UIViewController {

    private let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.declarative {
            UIStackView {
                UICalendarView()
                    .calendar(Calendar(identifier: .gregorian))
                    .locale(Locale.current)
                    .fontDesign(.rounded)
                    .availableDateRange(DateInterval(start: Date(), end: Calendar.current.date(byAdding: .year, value: 1, to: Date())!))
                    .delegate(self)
                    .selectionBehavior(UICalendarSelectionSingleDate(delegate: self))

                self.label
                    .text("Selected Date: None")
                    .textAlignment(.center)
            }
            .spacing(20)
            .center()
        }
    }
}

@available(iOS 16.0, *)
extension CalendarViewController: @preconcurrency UICalendarViewDelegate {
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        // 例: 今日の日付にマークを付ける
        if dateComponents.day == Calendar.current.dateComponents([.day], from: Date()).day {
            return .default(color: .systemBlue, size: .large)
        }
        return nil
    }
}

@available(iOS 16.0, *)
extension CalendarViewController: @preconcurrency UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        if let date = Calendar.current.date(from: dateComponents!) {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            label.text = "Selected Date: \(formatter.string(from: date))"
        }
    }
}
