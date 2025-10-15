import UIKit

public extension UIStepper {

    @discardableResult
    func value(_ value: Double) -> Self {
        self.value = value
        return self
    }

    @discardableResult
    func minimumValue(_ minimumValue: Double) -> Self {
        self.minimumValue = minimumValue
        return self
    }

    @discardableResult
    func maximumValue(_ maximumValue: Double) -> Self {
        self.maximumValue = maximumValue
        return self
    }

    @discardableResult
    func stepValue(_ stepValue: Double) -> Self {
        self.stepValue = stepValue
        return self
    }

    @discardableResult
    func isContinuous(_ isContinuous: Bool) -> Self {
        self.isContinuous = isContinuous
        return self
    }

    @discardableResult
    func wraps(_ wraps: Bool) -> Self {
        self.wraps = wraps
        return self
    }

    @discardableResult
    func backgroundImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        self.setBackgroundImage(image, for: state)
        return self
    }

    @discardableResult
    func dividerImage(_ image: UIImage?, forLeftSegmentState leftState: UIControl.State = .normal, rightSegmentState rightState: UIControl.State = .normal) -> Self {
        self.setDividerImage(image, forLeftSegmentState: leftState, rightSegmentState: rightState)
        return self
    }

    @discardableResult
    func incrementImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        self.setIncrementImage(image, for: state)
        return self
    }

    @discardableResult
    func decrementImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        self.setDecrementImage(image, for: state)
        return self
    }
}
