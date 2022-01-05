
import Foundation
import UIKit.UILayoutGuide

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
}

public struct UIEdgeBools {
    public var top: Bool = true
    public var leading: Bool = true
    public var bottom: Bool = true
    public var trailing: Bool = true
    
    public init(top: Bool = true, leading: Bool = true, bottom: Bool = true, trailing: Bool = true) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
    }
    
    public init(all: Bool) {
        self.init(top: all, leading: all, bottom: all, trailing: all)
    }

    public init(vertical: Bool) {
        self.init(top: vertical, leading: true, bottom: vertical, trailing: true)
    }
    
    public init(horizontal: Bool) {
        self.init(top: true, leading: horizontal, bottom: true, trailing: horizontal)
    }
}

public struct UIEdgePriorities {
    public var top: UILayoutPriority = .required
    public var leading: UILayoutPriority = .required
    public var bottom: UILayoutPriority = .required
    public var trailing: UILayoutPriority = .required
    
    public init(top: UILayoutPriority = .required, leading: UILayoutPriority = .required, bottom: UILayoutPriority = .required, trailing: UILayoutPriority = .required) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
    }
    
    public init(all: UILayoutPriority) {
        self.init(top: all, leading: all, bottom: all, trailing: all)
    }

    public init(vertical: UILayoutPriority) {
        self.init(top: vertical, leading: .required, bottom: vertical, trailing: .required)
    }
    
    public init(horizontal: UILayoutPriority) {
        self.init(top: .required, leading: horizontal, bottom: .required, trailing: horizontal)
    }
}

