//
//  UISegmentedControl+.swift
//
import UIKit.UISegmentedControl

//MARK: - Declarative method
public extension UISegmentedControl {
    
    @discardableResult
    func insertSegmentAction(_ action: UIAction, at segment: Int, animated: Bool = true) -> Self {
        self.insertSegment(action: action, at: segment, animated: animated)
        return self
    }

    @discardableResult
    func action(_ action: UIAction, forSegmentAt segment: Int) -> Self {
        self.setAction(action, forSegmentAt: segment)
        return self
    }

    @discardableResult
    func isMomentary(_ isMomentary: Bool) -> Self {
        self.isMomentary = isMomentary
        return self
    }
    
    @discardableResult
    func apportionsSegmentWidthsByContent(_ apportionsSegmentWidthsByContent: Bool) -> Self {
        self.apportionsSegmentWidthsByContent = apportionsSegmentWidthsByContent
        return self
    }
    
    @discardableResult
    func insertSegment(title: String?, at segment: Int, animated: Bool = true) -> Self {
        self.insertSegment(withTitle: title, at: segment, animated: animated)
        return self
    }

    @discardableResult
    func insertSegment(image: UIImage?, at segment: Int, animated: Bool = true) -> Self {
        self.insertSegment(with: image, at: segment, animated: animated)
        return self
    }

    @discardableResult
    func remove(segment: Int, animated: Bool = true) -> Self {
        self.removeSegment(at: segment, animated: animated)
        return self
    }

    @discardableResult
    func removeAll() -> Self {
        self.removeAllSegments()
        return self
    }

    @discardableResult
    func title(_ title: String?, forSegmentAt segment: Int) -> Self {
        self.setTitle(title, forSegmentAt: segment)
        return self
    }
    
    @discardableResult
    func image(_ image: UIImage?, forSegmentAt segment: Int) -> Self {
        self.setImage(image, forSegmentAt: segment)
        return self
    }
    
    @discardableResult
    func width(_ width: CGFloat, forSegmentAt segment: Int) -> Self {
        self.setWidth(width, forSegmentAt: segment)
        return self
    }

    @discardableResult
    func contentOffset(_ contentOffset: CGSize, forSegmentAt segment: Int) -> Self {
        self.setContentOffset(contentOffset, forSegmentAt: segment)
        return self
    }
    
    @discardableResult
    func enabled(_ enabled: Bool, forSegmentAt segment: Int) -> Self {
        self.setEnabled(enabled, forSegmentAt: segment)
        return self
    }
    
    @discardableResult
    func selectedSegmentIndex(_ selectedSegmentIndex: Int) -> Self {
        self.selectedSegmentIndex = selectedSegmentIndex
        return self
    }
    
    @discardableResult
    func selectedSegmentTintColor(_ selectedSegmentTintColor: UIColor?) -> Self {
        self.selectedSegmentTintColor = selectedSegmentTintColor
        return self
    }

    @discardableResult
    func backgroundImage(_ backgroundImage: UIImage?, for state: UIControl.State = .normal, barMetrics: UIBarMetrics = .default) -> Self {
        self.setBackgroundImage(backgroundImage, for: state, barMetrics: barMetrics)
        return self
    }
    
    @discardableResult
    func dividerImage(_ dividerImage: UIImage?, forLeftSegmentState leftState: UIControl.State = .normal, rightSegmentState rightState: UIControl.State = .normal, barMetrics: UIBarMetrics = .default) -> Self {
        self.setDividerImage(dividerImage, forLeftSegmentState: leftState, rightSegmentState: rightState, barMetrics: barMetrics)
        return self
    }

    @discardableResult
    func titleTextAttributes(_ attributes: [NSAttributedString.Key : Any]?, for state: UIControl.State = .normal) -> Self {
        self.setTitleTextAttributes(attributes, for: state)
        return self
    }
    
    @discardableResult
    func contentPositionAdjustment(_ adjustment: UIOffset, forSegmentType leftCenterRightOrAlone: UISegmentedControl.Segment, barMetrics: UIBarMetrics = .default) -> Self {
        self.setContentPositionAdjustment(adjustment, forSegmentType: leftCenterRightOrAlone, barMetrics: barMetrics)
        return self
    }
}
