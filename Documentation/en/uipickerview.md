# UIPickerView

## function

### some default parameters

The following standard parameters can be written declaratively.

```swift
func dataSource(_ dataSource: UIPickerViewDataSource) -> Self

func delegate(_ delegate: UIPickerViewDelegate) -> Self
```

#### sample

```swift
class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let items = ["A", "B", "C"]

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.declarative {
            UIPickerView()
                .dataSource(self)
                .delegate(self)
        }
    }
}
```
