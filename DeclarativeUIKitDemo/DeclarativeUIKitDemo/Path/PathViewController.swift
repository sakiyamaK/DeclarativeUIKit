import UIKit

final class PathViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.declarative {
            UIStackView { superview in
                UIView()
                    .path {
                        let size = superview.frame.size
                        $0.move(to: CGPoint(x: 0, y: 0))
                        $0.addLine(to: CGPoint(x: size.width, y: size.height))
                    }
                    .stroke(.red, lineWidth: 10)
            }
        }
    }
}
