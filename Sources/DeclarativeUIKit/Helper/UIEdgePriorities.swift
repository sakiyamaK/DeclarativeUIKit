import Foundation
import UIKit.UILayoutGuide

/// レイアウトの四隅の制約の優先度を管理するパラメータ
public struct UIEdgePriorities {
    public var top: UILayoutPriority = .required
    public var leading: UILayoutPriority = .required
    public var bottom: UILayoutPriority = .required
    public var trailing: UILayoutPriority = .required
    
    /// 四隅のそれぞれの優先度を決めて初期化
    /// - Parameters:
    ///   - top: 上辺の優先度
    ///   - leading: 文頭辺の優先度
    ///   - bottom: 下辺の優先度
    ///   - trailing: 文末辺の優先度
    public init(top: UILayoutPriority = .required, leading: UILayoutPriority = .required, bottom: UILayoutPriority = .required, trailing: UILayoutPriority = .required) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
    }

    public init(
        top: Float = 1000,
        leading: Float = 1000,
        bottom: Float = 1000,
        trailing: Float = 1000
    ) {
        self.top = .init(top)
        self.leading = .init(leading)
        self.bottom = .init(bottom)
        self.trailing = .init(trailing)
    }

    public init() {
        self.top = .init(1000)
        self.leading =  .init(1000)
        self.bottom =  .init(1000)
        self.trailing =  .init(1000)
    }

    /// 四隅の優先度を決めて初期化
    /// - Parameter all: 四隅の優先度
    public init(all: UILayoutPriority) {
        self.init(top: all, leading: all, bottom: all, trailing: all)
    }

    
    /// 縦方向の優先度を決めて初期化
    /// - Parameter vertical: 縦方向の優先度
    public init(vertical: UILayoutPriority) {
        self.init(top: vertical, leading: .required, bottom: vertical, trailing: .required)
    }
    
    /// 横方向の優先度を決めて初期化
    /// - Parameter vertical: 横方向の優先度
    public init(horizontal: UILayoutPriority) {
        self.init(top: .required, leading: horizontal, bottom: .required, trailing: horizontal)
    }
}
