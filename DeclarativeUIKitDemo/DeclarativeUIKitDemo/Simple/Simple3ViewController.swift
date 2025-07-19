//
//  Simple3ViewController.swift
//  DeclarativeUIKit
//
//  Created by sakiyamaK on 2025/07/19.
//

import UIKit
import DeclarativeUIKit

final class Simple3ViewController: UIViewController {

    private let pickerLabel = UILabel()
    private let stepperLabel = UILabel()

    private let pickerData = ["Apple", "Banana", "Grape", "Orange"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.declarative {

            UIScrollView {
                UIStackView {

                    UIActivityIndicatorView()
                        .style(.large)
                        .color(.systemBlue)
                        .animating(true)

                    UIView.divider()

                    UIColorWell(primaryActionHandler: { action in
                        guard let view = action.sender as? UIColorWell else {
                            return
                        }
                        print(view.selectedColor ?? .clear)
                    })

                    UIView.divider()

                    UIStepper()
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
                        .addAction(.valueChanged) { [weak self] action in
                            guard let self, let stepper = action.sender as? UIStepper else { return }
                            self.stepperLabel.text = "Value: \(stepper.value)"
                        }
                        .centerX()

                    self.stepperLabel
                        .textAlignment(.center)
                        .contentPriorities(.init(vertical: .required))

                    UIView.divider()

                    UIPickerView()
                        .dataSource(self)
                        .delegate(self)

                    self.pickerLabel
                        .textAlignment(.center)
                        .text(self.pickerData[0])
                        .contentPriorities(.init(vertical: .required))

                    UIView.divider()

                    UIDatePicker()
                        .calendar(Calendar(identifier: .gregorian))
                        .preferredDatePickerStyle(.wheels)
                        .datePickerMode(.dateAndTime)
                }
                .spacing(20)
                .margins(.init(horizontal: 20))
            }
        }
    }
}


extension Simple3ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerData[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerLabel.text = pickerData[row]
    }
}
