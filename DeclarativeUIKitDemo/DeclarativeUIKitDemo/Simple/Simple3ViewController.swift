//
//  Simple3ViewController.swift
//  DeclarativeUIKit
//
//  Created by sakiyamaK on 2025/07/19.
//

import UIKit
import DeclarativeUIKit

final class Simple3ViewController: UIViewController {

    private let pickerView = UIPickerView()
    private let label = UILabel()

    private let pickerData = ["Apple", "Banana", "Grape", "Orange"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.declarative {

            UIScrollView {
                UIStackView {
                    UILabel("UIPickerView")
                        .font(UIFont.boldSystemFont(ofSize: 20))
                        .contentPriorities(.init(vertical: .required))

                    self.pickerView
                        .dataSource(self)
                        .delegate(self)

                    self.label
                        .contentPriorities(.init(vertical: .required))

                    UIView.divider()

                    UILabel("UIDatePicker")
                        .font(UIFont.boldSystemFont(ofSize: 20))

                    UIDatePicker()
                        .calendar(Calendar(identifier: .gregorian))
                        .preferredDatePickerStyle(.wheels)
                        .datePickerMode(.dateAndTime)

                    UIActivityIndicatorView()
                        .style(.large)
                        .color(.systemBlue)
                        .animating(true)

                    UIActivityIndicatorView()
                        .style(.medium)
                        .color(.systemRed)
                        .animating(true)

                    UIColorWell(primaryActionHandler: { action in
                        guard let view = action.sender as? UIColorWell else {
                            return
                        }
                        print(view.selectedColor ?? .clear)
                    })
                }
                .spacing(20)
                .margins(.init(horizontal: 20))
            }
        }
        
        pickerView.selectRow(0, inComponent: 0, animated: false)
        label.text = pickerData[0]
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
        label.text = pickerData[row]
    }
}
