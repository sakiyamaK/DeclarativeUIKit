import UIKit
import DeclarativeUIKit

final class StepperViewController: UIViewController {

    private let stepper = UIStepper()
    private let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.declarative {
            UIStackView {
                self.stepper
                    .value(0.0)
                    .minimumValue(0.0)
                    .maximumValue(10.0)
                    .stepValue(1.0)
                    .isContinuous(true)
                    .wraps(false)
                    .backgroundImage(UIImage(systemName: "rectangle.fill"))
                    .incrementImage(UIImage(systemName: "plus.circle.fill"))
                    .decrementImage(UIImage(systemName: "minus.circle.fill"))
                    .dividerImage(UIImage(systemName: "line.horizontal.3"))
                    .addAction(.valueChanged) { [weak self] _ in
                        guard let self else { return }
                        self.label.text = "Value: \(self.stepper.value)"
                    }

                self.label
                    .text("Value: \(self.stepper.value)")
                    .textAlignment(.center)
                    .padding(insets: .init(top: 10))
            }
            .spacing(20)
            .center()
        }
    }
}
