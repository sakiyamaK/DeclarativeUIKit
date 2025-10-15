import Foundation

@MainActor
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

@MainActor
extension UIEdgeBools {
    var layoutGuides: UIEdgeLayoutGuides {
        UIEdgeLayoutGuides(
            top: self.top ? .safeArea : .normal,
            leading: self.leading ? .safeArea : .normal,
            bottom: self.bottom ? .safeArea : .normal,
            trailing: self.trailing ? .safeArea : .normal
        )
    }
}
