import UIKit

public extension UIProgressView {

    @discardableResult
    func progressViewStyle(_ progressViewStyle: UIProgressView.Style) -> Self {
        self.progressViewStyle = progressViewStyle
        return self
    }

    @discardableResult
    func progress(_ progress: Float, animated: Bool = false) -> Self {
        self.setProgress(progress, animated: animated)
        return self
    }

    @discardableResult
    func progressTintColor(_ progressTintColor: UIColor?) -> Self {
        self.progressTintColor = progressTintColor
        return self
    }

    @discardableResult
    func trackTintColor(_ trackTintColor: UIColor?) -> Self {
        self.trackTintColor = trackTintColor
        return self
    }

    @discardableResult
    func progressImage(_ progressImage: UIImage?) -> Self {
        self.progressImage = progressImage
        return self
    }

    @discardableResult
    func trackImage(_ trackImage: UIImage?) -> Self {
        self.trackImage = trackImage
        return self
    }

    @discardableResult
    func observedProgress(_ observedProgress: Progress?) -> Self {
        self.observedProgress = observedProgress
        return self
    }
}
