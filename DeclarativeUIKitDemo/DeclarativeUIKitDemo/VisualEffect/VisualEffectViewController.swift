import UIKit
import DeclarativeUIKit

final class VisualEffectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.declarative {
            UIImageView(image: UIImage(named: "silversalmoncreek"))
                .contentMode(.scaleAspectFill)
                .floatingActionView(
                    position: .centerCenter
                ) {
                    UIVisualEffectView()
                        .effect(UIBlurEffect(style: .light))
                        .size(width: 200, height: 200)
                }
        }
    }
}
