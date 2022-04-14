//
//  UIProgressView+.swift
//  
//
//  Created by sakiyamaK on 2022/04/14.
//

import UIKit

//MARK: - Declarative method
public extension UIProgressView {
    @discardableResult
    func progress(_ progress: Float, animated: Bool = false) -> Self {
        self.setProgress(progress, animated: animated)
        return self
    }
    
    @discardableResult
    func progress(_ progress: CGFloat, animated: Bool = false) -> Self {
        self.progress(Float(progress), animated: animated)
        return self
    }

    @discardableResult
    func progress(_ progress: Double, animated: Bool = false) -> Self {
        self.progress(Float(progress), animated: animated)
        return self
    }
    
    @discardableResult
    func observedProgress(_ observedProgress: Progress?) -> Self {
        self.observedProgress = observedProgress
        return self
    }

    @discardableResult
    func progressViewStyle(_ progressViewStyle: UIProgressView.Style) -> Self {
        self.progressViewStyle = progressViewStyle
        return self
    }

    @discardableResult
    func style(_ style: UIProgressView.Style) -> Self {
        self.progressViewStyle = style
        return self
    }
    
    @discardableResult
    func progressTintColor(_ progressTintColor: UIColor) -> Self {
        self.progressTintColor = progressTintColor
        return self
    }

    @discardableResult
    func progressImage(_ progressImage: UIImage) -> Self {
        self.progressImage = progressImage
        return self
    }

    @discardableResult
    func trackTintColor(_ trackTintColor: UIColor) -> Self {
        self.trackTintColor = trackTintColor
        return self
    }

    @discardableResult
    func trackImage(_ trackImage: UIImage) -> Self {
        self.trackImage = trackImage
        return self
    }
}
