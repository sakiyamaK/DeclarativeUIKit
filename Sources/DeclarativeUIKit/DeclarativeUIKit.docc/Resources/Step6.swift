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

        self.view.declarative {
            UIStackView.vStack(spacing: 16) {
                nameLabel

                UIStackView.hStack(spacing: 12) {
                    UILabel("Followers: 128")
                    UILabel("Following: 256")
                }
            }
            .margins(.init(top: 20, left: 20, bottom: 20, right: 20))
            .backgroundColor(.secondarySystemBackground)
            .cornerRadius(12)
            .center()
        }
    }
}
