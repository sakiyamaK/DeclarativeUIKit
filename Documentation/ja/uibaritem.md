# UIBarItem

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます

```swift
    func title(_ title: String?) -> Self

    func image(_ image: UIImage?) -> Self

    func largeContentSizeImage(_ largeContentSizeImage: UIImage?) -> Self

    func imageInsets(_ imageInsets: UIEdgeInsets) -> Self

    func landscapeImagePhoneInsets(_ landscapeImagePhoneInsets: UIEdgeInsets) -> Self

    func largeContentSizeImageInsets(_ largeContentSizeImageInsets: UIEdgeInsets) -> Self

    func isEnabled(_ isEnabled: Bool) -> Self

    func tag(_ tag: Int) -> Self

    func titleTextAttributes(_ attributes: [NSAttributedString.Key: Any]?, for: UIControl.State) -> Self
```

#### sample

```swift
final class ViewController: UIViewController {
       
    override func loadView() {
        super.loadView()
        self.applyNavigationItem({
            $0.rightBarButtonItems = [
                UIBarButtonItem(barButtonSystemItem: .action)
                    .target(self)
                    .backgroundImage(UIImage(systemName: "trash"), for: .normal, barMetrics: .default)
                    .action({_ in
                        print("tap")
                    }),
                UIBarButtonItem()
                    .title("test1")
                    .style(.plain)
                    .target(self)
                    .tintColor(.brown)
                    .action({ _ in
                        print("tap2")
                    }),
            ]
        })
    }
```

