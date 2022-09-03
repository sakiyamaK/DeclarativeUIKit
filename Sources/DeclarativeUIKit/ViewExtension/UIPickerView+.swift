import UIKit.UIPickerView

//MARK: - Declarative method
public extension UIPickerView {
    @discardableResult
    func dataSource(_ dataSource: NSObject & UIPickerViewDataSource) -> Self {
        self.dataSource = dataSource
        return self
    }

    @discardableResult
    func delegate(_ delegate: NSObject & UIPickerViewDelegate) -> Self {
        self.delegate = delegate
        return self
    }
}
