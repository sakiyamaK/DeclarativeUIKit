import UIKit
import DeclarativeUIKit

@available(iOS 17.0, *)
final class ContentUnavailableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground

        self.declarative {
            UIContentUnavailableView(
                configuration: UIContentUnavailableConfiguration.empty()
                    .text("No Content Available")
                    .secondaryText("There is no content to display at this time. Please check back later.")
                    .image(UIImage(systemName: "exclamationmark.triangle.fill"))
                    .button(UIButton.Configuration.filled().title("Reload")) { _ in
                        print("Reload")
                    }
                    .secondaryButton(UIButton.Configuration.bordered().title("Cancel")) { _ in
                        print("Cancel")
                    }
                    .imageToTextPadding(20)
                    .textToSecondaryTextPadding(10)
                    .textToButtonPadding(30)
                    .buttonToSecondaryButtonPadding(10)
            )
            .center()
        }
    }
}
