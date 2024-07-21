//
//  UIPageControl+.swift
//
//
//  Created by sakiyamaK on 2024/07/21.
//

import UIKit.UIPageControl

public extension UIPageControl {
    
    @discardableResult
    func numberOfPages(_ numberOfPages: Int) -> Self {
        self.numberOfPages = numberOfPages
        return self
    }

    @discardableResult
    func currentPage(_ currentPage: Int) -> Self {
        self.currentPage = currentPage
        return self
    }

    @discardableResult
    func hidesForSinglePage(_ hidesForSinglePage: Bool) -> Self {
        self.hidesForSinglePage = hidesForSinglePage
        return self
    }

    
    @available(iOS 17.0, *)
    @discardableResult
    func progress(_ progress: UIPageControlProgress?) -> Self {
        self.progress = progress
        return self
    }
    
    @discardableResult
    func pageIndicatorTintColor(_ pageIndicatorTintColor: UIColor?) -> Self {
        self.pageIndicatorTintColor = pageIndicatorTintColor
        return self
    }

    @discardableResult
    func currentPageIndicatorTintColor(_ currentPageIndicatorTintColor: UIColor?) -> Self {
        self.currentPageIndicatorTintColor = currentPageIndicatorTintColor
        return self
    }

    @discardableResult
    @available(iOS 14.0, *)
    func backgroundStyle(_ backgroundStyle: UIPageControl.BackgroundStyle) -> Self {
        self.backgroundStyle = backgroundStyle
        return self
    }

    @discardableResult
    @available(iOS 16.0, *)
    func direction(_ direction: UIPageControl.Direction) -> Self {
        self.direction = direction
        return self
    }

    @discardableResult
    @available(iOS 14.0, *)
    func allowsContinuousInteraction(_ allowsContinuousInteraction: Bool) -> Self {
        self.allowsContinuousInteraction = allowsContinuousInteraction
        return self
    }

    @discardableResult
    @available(iOS 14.0, *)
    func preferredIndicatorImage(_ preferredIndicatorImage: UIImage?) -> Self {
        self.preferredIndicatorImage = preferredIndicatorImage
        return self
    }
    
    @discardableResult
    @available(iOS 14.0, *)
    func indicator(image: UIImage?, forPage page: Int) -> Self {
        setIndicatorImage(image, forPage: page)
        return self
    }

    @available(iOS 14.0, *)
    func indicator(image: UIImage?) -> Self {
        for page in 0..<numberOfPages {
            setIndicatorImage(image, forPage: page)
        }
        return self
    }

    
    @discardableResult
    @available(iOS 16.0, *)
    func preferredCurrentPageIndicatorImage(_ preferredCurrentPageIndicatorImage: UIImage?) -> Self {
        self.preferredCurrentPageIndicatorImage = preferredCurrentPageIndicatorImage
        return self
    }
    
    @discardableResult
    @available(iOS 16.0, *)
    func currentPageIndicator(image: UIImage?, forPage page: Int) -> Self {
        setCurrentPageIndicatorImage(image, forPage: page)
        return self
    }

    @discardableResult
    @available(iOS 16.0, *)
    func currentPageIndicator(image: UIImage?) -> Self {
        for page in 0..<numberOfPages {
            setCurrentPageIndicatorImage(image, forPage: page)
        }
        return self
    }
}
