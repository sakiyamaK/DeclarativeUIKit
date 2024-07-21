//
//  UIPageControl+.swift
//
//
//  Created by sakiyamaK on 2024/07/21.
//

import UIKit.UISlider

public extension UISlider {
    
    @discardableResult
    func value(_ value: Float) -> Self {
        self.value = value
        return self
    }

    @discardableResult
    func minimumValue(_ minimumValue: Float) -> Self {
        self.minimumValue = minimumValue
        return self
    }

    @discardableResult
    func maximumValue(_ maximumValue: Float) -> Self {
        self.maximumValue = maximumValue
        return self
    }

    @discardableResult
    func minimumValueImage(_ minimumValueImage: UIImage?) -> Self {
        self.minimumValueImage = minimumValueImage
        return self
    }

    @discardableResult
    func maximumValueImage(_ maximumValueImage: UIImage?) -> Self {
        self.maximumValueImage = maximumValueImage
        return self
    }

    @discardableResult
    func isContinuous(_ isContinuous: Bool) -> Self {
        self.isContinuous = isContinuous
        return self
    }

    @discardableResult
    func minimumTrackTintColor(_ minimumTrackTintColor: UIColor?) -> Self {
        self.minimumTrackTintColor = minimumTrackTintColor
        return self
    }

    @discardableResult
    func maximumTrackTintColor(_ maximumTrackTintColor: UIColor?) -> Self {
        self.maximumTrackTintColor = maximumTrackTintColor
        return self
    }

    @discardableResult
    func thumbTintColor(_ thumbTintColor: UIColor?) -> Self {
        self.thumbTintColor = thumbTintColor
        return self
    }

    @discardableResult
    func value(_ value: Float, animated: Bool) -> Self {
        self.setValue(value, animated: animated)
        return self
    }

    @discardableResult
    func thumbImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        self.setThumbImage(image, for: state)
        return self
    }

    @discardableResult
    func minimumTrackImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        self.setMinimumTrackImage(image, for: state)
        return self
    }

    @discardableResult
    func maximumTrackImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        self.setMaximumTrackImage(image, for: state)
        return self
    }
}
