//
//  UIBarItem+.swift
//  
//
//  Created by sakiyamaK on 2023/07/02.
//

import UIKit.UIBarItem

public extension UIBarItem {
    @discardableResult
    func title(_ title: String?) -> Self {
        self.title = title
        return self
    }

    @discardableResult
    func image(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }

    @discardableResult
    func largeContentSizeImage(_ largeContentSizeImage: UIImage?) -> Self {
        self.largeContentSizeImage = largeContentSizeImage
        return self
    }

    @discardableResult
    func imageInsets(_ imageInsets: UIEdgeInsets) -> Self {
        self.imageInsets = imageInsets
        return self
    }
    
    @discardableResult
    func landscapeImagePhoneInsets(_ landscapeImagePhoneInsets: UIEdgeInsets) -> Self {
        self.landscapeImagePhoneInsets = landscapeImagePhoneInsets
        return self
    }

    @discardableResult
    func largeContentSizeImageInsets(_ largeContentSizeImageInsets: UIEdgeInsets) -> Self {
        self.largeContentSizeImageInsets = largeContentSizeImageInsets
        return self
    }

    @discardableResult
    func isEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }

    @discardableResult
    func tag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }
}

public extension UIBarItem {
    func titleTextAttributes(_ attributes: [NSAttributedString.Key: Any]?, for: UIControl.State) -> Self {
        self.setTitleTextAttributes(attributes, for: `for`)
        return self
    }        
}
