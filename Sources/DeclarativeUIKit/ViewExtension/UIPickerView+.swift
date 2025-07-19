import UIKit.UIPickerView

//MARK: - Declarative method
public extension UIPickerView {
    @discardableResult
    func dataSource(_ dataSource: UIPickerViewDataSource) -> Self {
        self.dataSource = dataSource
        return self
    }

    @discardableResult
    func delegate(_ delegate: UIPickerViewDelegate) -> Self {
        self.delegate = delegate
        return self
    }    
}
