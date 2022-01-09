import Foundation
import UIKit.UILayoutGuide

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
