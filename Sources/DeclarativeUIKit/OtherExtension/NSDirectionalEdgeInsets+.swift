//
//  NSDirectionalEdgeInsets+.swift
//  
//
//  Created by sakiyamaK on 2024/08/09.
//

import UIKit

public extension NSDirectionalEdgeInsets {
    init(all: CGFloat) {
        self.init(top: all, leading: all, bottom: all, trailing: all)
    }
    
    init(vertical: CGFloat, horizontal: CGFloat = 0) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }

    init(horizontal: CGFloat, vertical: CGFloat = 0) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }

    init(top: CGFloat) {
        self.init(top: top, leading: 0, bottom: 0, trailing: 0)
    }
    
    init(leading: CGFloat) {
        self.init(top: 0, leading: leading, bottom: 0, trailing: 0)
    }

    init(bottom: CGFloat) {
        self.init(top: 0, leading: 0, bottom: bottom, trailing: 0)
    }

    init(trailing: CGFloat) {
        self.init(top: 0, leading: 0, bottom: 0, trailing: trailing)
    }
}
