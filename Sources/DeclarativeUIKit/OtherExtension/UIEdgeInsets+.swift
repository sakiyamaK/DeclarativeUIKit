//
//  UIEdgeInsets+.swift
//  
//
//  Created by sakiyamaK on 2024/06/30.
//

import UIKit

public extension UIEdgeInsets {
    init(all: CGFloat) {
        self.init(top: all, left: all, bottom: all, right: all)
    }

    init(vertical: CGFloat) {
        self.init(top: vertical, left: 0, bottom: vertical, right: 0)
    }
    
    init(horizontal: CGFloat) {
        self.init(top: 0, left: horizontal, bottom: 0, right: horizontal)
    }
    
    init(vertical: CGFloat, horizontal: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    
    init(top: CGFloat) {
        self.init(top: top, left: 0, bottom: 0, right: 0)
    }
    
    init(left: CGFloat) {
        self.init(top: 0, left: left, bottom: 0, right: 0)
    }

    init(bottom: CGFloat) {
        self.init(top: 0, left: 0, bottom: bottom, right: 0)
    }

    init(right: CGFloat) {
        self.init(top: 0, left: 0, bottom: 0, right: right)
    }
}
