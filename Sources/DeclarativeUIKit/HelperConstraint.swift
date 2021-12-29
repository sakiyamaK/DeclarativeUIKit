import UIKit.NSLayoutConstraint
import UIKit.NSLayoutAnchor

public extension NSLayoutDimension {
    static func * (lhs: NSLayoutDimension, rhs: CGFloat) -> HelperConstraint {
        .init(dimension: lhs, multiplier: rhs)
    }

    static func / (lhs: NSLayoutDimension, rhs: CGFloat) -> HelperConstraint {
        .init(dimension: lhs, multiplier: 1.0/rhs)
    }

    static func + (lhs: NSLayoutDimension, rhs: CGFloat) -> HelperConstraint {
        .init(dimension: lhs, constant: rhs)
    }
    
    static func - (lhs: NSLayoutDimension, rhs: CGFloat) -> HelperConstraint {
        .init(dimension: lhs, constant: -rhs)
    }
}

public struct HelperConstraint {
    public var dimension: NSLayoutDimension
    public var multiplier: CGFloat = 1
    public var constant: CGFloat = 0
        
    public static func * (lhs: HelperConstraint, rhs: CGFloat) -> HelperConstraint {
        var rtn = lhs
        rtn.multiplier = rhs
        return rtn
    }

    public static func / (lhs: HelperConstraint, rhs: CGFloat) -> HelperConstraint {
        var rtn = lhs
        rtn.multiplier = 1.0/rhs
        return rtn
    }

    public static func + (lhs: HelperConstraint, rhs: CGFloat) -> HelperConstraint {
        var rtn = lhs
        rtn.constant = rhs
        return rtn
    }

    public static func - (lhs: HelperConstraint, rhs: CGFloat) -> HelperConstraint {
        var rtn = lhs
        rtn.constant = -rhs
        return rtn
    }
}
