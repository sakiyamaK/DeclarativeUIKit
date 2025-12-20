import UIKit
import DeclarativeUIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let nameLabel = UILabel("John Doe")
            .font(.systemFont(ofSize: 24, weight: .bold))
            .textColor(.label)
            .numberOfLines(1)
            .textAlignment(.center)
    }
}
