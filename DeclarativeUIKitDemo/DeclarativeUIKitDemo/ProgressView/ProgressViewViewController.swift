import UIKit
import DeclarativeUIKit

final class ProgressViewViewController: UIViewController {

    deinit { print(#function) }

    private let progressView = UIProgressView()
    private var progressTask: Task<Void, Never>? = nil
    private var progress = Progress(totalUnitCount: 10)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.declarative {
            UIStackView {
                self.progressView
                    .progressViewStyle(.default)
                    .progressTintColor(.systemBlue)
                    .trackTintColor(.systemGray5)
                    .progress(0.0)

                UIProgressView()
                    .observedProgress(self.progress)

                UIButton(configurationBuilder: {
                    UIButton.Configuration.filled()
                        .title("Start Progress")
                }, primaryAction: nil)
                .addAction(.touchUpInside) { [weak self] _ in
                    self?.startProgress()
                }
                
                UIButton(configurationBuilder: {
                    UIButton.Configuration.filled()
                        .title("Reset Progress")
                }, primaryAction: nil)
                .addAction(.touchUpInside) { [weak self] _ in
                    self?.resetProgress()
                }
            }
            .spacing(20)
            .center()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        progressTask?.cancel()
    }

    private func startProgress() {
        progressTask?.cancel()
        progressTask = Task {
            var currentProgress: Float = 0.0
            while currentProgress < 1.0 {
                do {
                    currentProgress += 0.1
                    try await Task.sleep(for: .milliseconds(100))
                    self.progressView.progress(currentProgress, animated: true)

                    self.progress.completedUnitCount += 1
                } catch {
                    break
                }
            }
        }
    }
    
    private func resetProgress() {
        progressTask?.cancel()
        self.progress.completedUnitCount = 0
        progressView.progress(0.0, animated: false)
    }
}
