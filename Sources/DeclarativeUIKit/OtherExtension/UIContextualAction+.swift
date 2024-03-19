//
//  UIContextualAction+.swift
//
//
//  Created by sakiyamaK on 2024/03/19.
//

import UIKit

public extension UIContextualAction {
    
    @discardableResult
    func title(_ title: String?) -> Self {
        self.title = title
        return self
    }

    @discardableResult
    func backgroundColor(_ backgroundColor: UIColor) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }
}

