import UIKit.UIViewController

@available(iOS 15.0, *)
public extension UIViewController {
    @discardableResult
    /// レイアウトを宣言的に書くメソッド
    /// - Parameters:
    ///   - layoutGuides: 四隅をどのレイアウトガイド内に収めるか
    ///   - priorities: 四隅の制約の優先度
    ///   - reset: すでに設定済みのViewを全て外すか
    ///   - outsideLayoutGuideTop: layoutGuidesの上辺の外側のレイアウト
    ///   - outsideLayoutGuideLeading: layoutGuidesの文頭辺の外側のレイアウト
    ///   - outsideLayoutGuideBottom: layoutGuidesの文末辺の外側のレイアウト
    ///   - outsideLayoutGuideTrailing: layoutGuidesの下辺の外側のレイアウト
    ///   - _: layoutGuides内のレイアウト
    /// - Returns: Self
    func declarativeAsync(
        layoutGuides: UIEdgeLayoutGuides,
        priorities: UIEdgePriorities = .init(all: .required),
        reset: Bool = false,
        @SingleUIViewBuilder outsideLayoutGuideTop outsideLayoutGuideTopBuilder: @escaping () async -> UIView? = { nil },
        @SingleUIViewBuilder outsideLayoutGuideLeading outsideLayoutGuideLeadingBuilder: @escaping () async -> UIView? = { nil },
        @SingleUIViewBuilder outsideLayoutGuideBottom outsideLayoutGuideBottomBuilder: @escaping () async -> UIView? = { nil },
        @SingleUIViewBuilder outsideLayoutGuideTrailing outsideLayoutGuideTrailingBuilder: @escaping () async -> UIView? = { nil },
        @SingleUIViewBuilder _ builder: @escaping () async -> UIView
    ) async -> Self {
        let view = await builder()
        if reset {
            self.view.subviews.forEach { $0.removeFromSuperview() }
        }
        self.view.edgesConstraints(view, layoutGuides: layoutGuides, priorities: priorities)
        
        //LayoutGuidesの上の外側
        if let topView = await outsideLayoutGuideTopBuilder() {
            
            topView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(topView)
            
            let bottomConstraint = switch layoutGuides.top {
            case .safeArea:
                self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: topView.bottomAnchor)
            case .margins:
                self.view.layoutMarginsGuide.topAnchor.constraint(equalTo: topView.bottomAnchor)
            case .readableContent:
                self.view.readableContentGuide.topAnchor.constraint(equalTo: topView.bottomAnchor)
            case .keyboard:
                self.view.keyboardLayoutGuide.topAnchor.constraint(equalTo: topView.bottomAnchor)
            case .normal:
                self.view.topAnchor.constraint(equalTo: topView.bottomAnchor)
            }
            
            NSLayoutConstraint.activate([
                topView.topAnchor.constraint(equalTo: self.view.topAnchor),
                topView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                bottomConstraint,
                self.view.trailingAnchor.constraint(equalTo: topView.trailingAnchor)
            ])
        }
        
        //セーフエリアの左の外側
        if let leadingView = await outsideLayoutGuideLeadingBuilder() {
            
            leadingView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(leadingView)
            
            let leadingConstraint = switch layoutGuides.leading {
            case .safeArea:
                leadingView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
            case .margins:
                leadingView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor)
            case .readableContent:
                leadingView.topAnchor.constraint(equalTo: self.view.readableContentGuide.topAnchor)
            case .keyboard:
                leadingView.topAnchor.constraint(equalTo: self.view.keyboardLayoutGuide.topAnchor)
            case .normal:
                leadingView.topAnchor.constraint(equalTo: self.view.topAnchor)
            }
            
            let bottomConstraint = switch layoutGuides.leading {
            case .safeArea:
                self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: leadingView.bottomAnchor)
            case .margins:
                self.view.layoutMarginsGuide.bottomAnchor.constraint(equalTo: leadingView.bottomAnchor)
            case .readableContent:
                self.view.readableContentGuide.bottomAnchor.constraint(equalTo: leadingView.bottomAnchor)
            case .keyboard:
                self.view.keyboardLayoutGuide.bottomAnchor.constraint(equalTo: leadingView.bottomAnchor)
            case .normal:
                self.view.bottomAnchor.constraint(equalTo: leadingView.bottomAnchor)
            }
            
            let trailingConstraint = switch layoutGuides.leading {
            case .safeArea:
                self.view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: leadingView.trailingAnchor)
            case .margins:
                self.view.layoutMarginsGuide.leadingAnchor.constraint(equalTo: leadingView.trailingAnchor)
            case .readableContent:
                self.view.readableContentGuide.leadingAnchor.constraint(equalTo: leadingView.trailingAnchor)
            case .keyboard:
                self.view.keyboardLayoutGuide.leadingAnchor.constraint(equalTo: leadingView.trailingAnchor)
            case .normal:
                self.view.leadingAnchor.constraint(equalTo: leadingView.trailingAnchor)
            }
            
            NSLayoutConstraint.activate([
                leadingConstraint,
                leadingView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                bottomConstraint,
                trailingConstraint
            ])
        }
        
        //セーフエリアの下の外側
        if let bottomView = await outsideLayoutGuideBottomBuilder() {
            
            bottomView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(bottomView)
            
            let topConstraint = switch layoutGuides.bottom {
            case .safeArea:
                bottomView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            case .margins:
                bottomView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor)
            case .readableContent:
                bottomView.topAnchor.constraint(equalTo: self.view.readableContentGuide.bottomAnchor)
            case .keyboard:
                bottomView.topAnchor.constraint(equalTo: self.view.keyboardLayoutGuide.bottomAnchor)
            case .normal:
                bottomView.topAnchor.constraint(equalTo: self.view.bottomAnchor)
            }
            
            NSLayoutConstraint.activate([
                topConstraint,
                bottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.view.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
                self.view.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor)
            ])
        }
        
        //セーフエリアの右の外側
        if let trailingView = await outsideLayoutGuideTrailingBuilder() {
            
            trailingView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(trailingView)
            
            let topConstraint = switch layoutGuides.trailing {
            case .safeArea:
                trailingView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
            case .margins:
                trailingView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor)
            case .readableContent:
                trailingView.topAnchor.constraint(equalTo: self.view.readableContentGuide.topAnchor)
            case .keyboard:
                trailingView.topAnchor.constraint(equalTo: self.view.keyboardLayoutGuide.topAnchor)
            case .normal:
                trailingView.topAnchor.constraint(equalTo: self.view.topAnchor)
            }
            
            let leadingConstraint = switch layoutGuides.trailing {
            case .safeArea:
                trailingView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
            case .margins:
                trailingView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor)
            case .readableContent:
                trailingView.leadingAnchor.constraint(equalTo: self.view.readableContentGuide.trailingAnchor)
            case .keyboard:
                trailingView.leadingAnchor.constraint(equalTo: self.view.keyboardLayoutGuide.trailingAnchor)
            case .normal:
                trailingView.leadingAnchor.constraint(equalTo: self.view.trailingAnchor)
            }
            
            let bottomConstraint = switch layoutGuides.trailing {
            case .safeArea:
                self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: trailingView.bottomAnchor)
            case .margins:
                self.view.layoutMarginsGuide.bottomAnchor.constraint(equalTo: trailingView.bottomAnchor)
            case .readableContent:
                self.view.readableContentGuide.bottomAnchor.constraint(equalTo: trailingView.bottomAnchor)
            case .keyboard:
                self.view.keyboardLayoutGuide.bottomAnchor.constraint(equalTo: trailingView.bottomAnchor)
            case .normal:
                self.view.bottomAnchor.constraint(equalTo: trailingView.bottomAnchor)
            }
            
            NSLayoutConstraint.activate([
                topConstraint,
                leadingConstraint,
                bottomConstraint,
                self.view.trailingAnchor.constraint(equalTo: trailingView.trailingAnchor)
            ])
        }
        return self
    }
    
    @discardableResult
    /// レイアウトを宣言的に書くメソッド
    /// - Parameters:
    ///   - layoutGuides: 四隅をどのレイアウトガイド内に収めるか
    ///   - priorities: 四隅の制約の優先度
    ///   - reset: すでに設定済みのViewを全て外すか
    ///   - outsideLayoutGuideTop: layoutGuidesの上辺の外側のレイアウト
    ///   - outsideLayoutGuideLeading: layoutGuidesの文頭辺の外側のレイアウト
    ///   - outsideLayoutGuideBottom: layoutGuidesの文末辺の外側のレイアウト
    ///   - outsideLayoutGuideTrailing: layoutGuidesの下辺の外側のレイアウト
    ///   - _: layoutGuides内のレイアウト
    /// - Returns: Self
    func declarative(
        layoutGuides: UIEdgeLayoutGuides,
        priorities: UIEdgePriorities = .init(all: .required),
        reset: Bool = false,
        @SingleUIViewBuilder outsideLayoutGuideTop outsideLayoutGuideTopBuilder: @escaping () -> UIView? = { nil },
        @SingleUIViewBuilder outsideLayoutGuideLeading outsideLayoutGuideLeadingBuilder: @escaping () -> UIView? = { nil },
        @SingleUIViewBuilder outsideLayoutGuideBottom outsideLayoutGuideBottomBuilder: @escaping () -> UIView? = { nil },
        @SingleUIViewBuilder outsideLayoutGuideTrailing outsideLayoutGuideTrailingBuilder: @escaping () -> UIView? = { nil },
        @SingleUIViewBuilder _ builder: @escaping () -> UIView
    ) -> Self {
        
        let view = builder()
        if reset {
            self.view.subviews.forEach { $0.removeFromSuperview() }
        }
        self.view.edgesConstraints(view, layoutGuides: layoutGuides, priorities: priorities)
        
        //LayoutGuidesの上の外側
        if let topView = outsideLayoutGuideTopBuilder() {
            
            topView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(topView)
            
            let bottomConstraint = switch layoutGuides.top {
            case .safeArea:
                self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: topView.bottomAnchor)
            case .margins:
                self.view.layoutMarginsGuide.topAnchor.constraint(equalTo: topView.bottomAnchor)
            case .readableContent:
                self.view.readableContentGuide.topAnchor.constraint(equalTo: topView.bottomAnchor)
            case .keyboard:
                self.view.keyboardLayoutGuide.topAnchor.constraint(equalTo: topView.bottomAnchor)
            case .normal:
                self.view.topAnchor.constraint(equalTo: topView.bottomAnchor)
            }
            
            NSLayoutConstraint.activate([
                topView.topAnchor.constraint(equalTo: self.view.topAnchor),
                topView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                bottomConstraint,
                self.view.trailingAnchor.constraint(equalTo: topView.trailingAnchor)
            ])
        }
        
        //セーフエリアの左の外側
        if let leadingView = outsideLayoutGuideLeadingBuilder() {
            
            leadingView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(leadingView)
            
            let leadingConstraint = switch layoutGuides.leading {
            case .safeArea:
                leadingView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
            case .margins:
                leadingView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor)
            case .readableContent:
                leadingView.topAnchor.constraint(equalTo: self.view.readableContentGuide.topAnchor)
            case .keyboard:
                leadingView.topAnchor.constraint(equalTo: self.view.keyboardLayoutGuide.topAnchor)
            case .normal:
                leadingView.topAnchor.constraint(equalTo: self.view.topAnchor)
            }
            
            let bottomConstraint = switch layoutGuides.leading {
            case .safeArea:
                self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: leadingView.bottomAnchor)
            case .margins:
                self.view.layoutMarginsGuide.bottomAnchor.constraint(equalTo: leadingView.bottomAnchor)
            case .readableContent:
                self.view.readableContentGuide.bottomAnchor.constraint(equalTo: leadingView.bottomAnchor)
            case .keyboard:
                self.view.keyboardLayoutGuide.bottomAnchor.constraint(equalTo: leadingView.bottomAnchor)
            case .normal:
                self.view.bottomAnchor.constraint(equalTo: leadingView.bottomAnchor)
            }
            
            let trailingConstraint = switch layoutGuides.leading {
            case .safeArea:
                self.view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: leadingView.trailingAnchor)
            case .margins:
                self.view.layoutMarginsGuide.leadingAnchor.constraint(equalTo: leadingView.trailingAnchor)
            case .readableContent:
                self.view.readableContentGuide.leadingAnchor.constraint(equalTo: leadingView.trailingAnchor)
            case .keyboard:
                self.view.keyboardLayoutGuide.leadingAnchor.constraint(equalTo: leadingView.trailingAnchor)
            case .normal:
                self.view.leadingAnchor.constraint(equalTo: leadingView.trailingAnchor)
            }
            
            NSLayoutConstraint.activate([
                leadingConstraint,
                leadingView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                bottomConstraint,
                trailingConstraint
            ])
        }
        
        //セーフエリアの下の外側
        if let bottomView = outsideLayoutGuideBottomBuilder() {
            
            bottomView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(bottomView)
            
            let topConstraint = switch layoutGuides.bottom {
            case .safeArea:
                bottomView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            case .margins:
                bottomView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor)
            case .readableContent:
                bottomView.topAnchor.constraint(equalTo: self.view.readableContentGuide.bottomAnchor)
            case .keyboard:
                bottomView.topAnchor.constraint(equalTo: self.view.keyboardLayoutGuide.bottomAnchor)
            case .normal:
                bottomView.topAnchor.constraint(equalTo: self.view.bottomAnchor)
            }
            
            NSLayoutConstraint.activate([
                topConstraint,
                bottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.view.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
                self.view.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor)
            ])
        }
        
        //セーフエリアの右の外側
        if let trailingView = outsideLayoutGuideTrailingBuilder() {
            
            trailingView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(trailingView)
            
            let topConstraint = switch layoutGuides.trailing {
            case .safeArea:
                trailingView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
            case .margins:
                trailingView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor)
            case .readableContent:
                trailingView.topAnchor.constraint(equalTo: self.view.readableContentGuide.topAnchor)
            case .keyboard:
                trailingView.topAnchor.constraint(equalTo: self.view.keyboardLayoutGuide.topAnchor)
            case .normal:
                trailingView.topAnchor.constraint(equalTo: self.view.topAnchor)
            }
            
            let leadingConstraint = switch layoutGuides.trailing {
            case .safeArea:
                trailingView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
            case .margins:
                trailingView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor)
            case .readableContent:
                trailingView.leadingAnchor.constraint(equalTo: self.view.readableContentGuide.trailingAnchor)
            case .keyboard:
                trailingView.leadingAnchor.constraint(equalTo: self.view.keyboardLayoutGuide.trailingAnchor)
            case .normal:
                trailingView.leadingAnchor.constraint(equalTo: self.view.trailingAnchor)
            }
            
            let bottomConstraint = switch layoutGuides.trailing {
            case .safeArea:
                self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: trailingView.bottomAnchor)
            case .margins:
                self.view.layoutMarginsGuide.bottomAnchor.constraint(equalTo: trailingView.bottomAnchor)
            case .readableContent:
                self.view.readableContentGuide.bottomAnchor.constraint(equalTo: trailingView.bottomAnchor)
            case .keyboard:
                self.view.keyboardLayoutGuide.bottomAnchor.constraint(equalTo: trailingView.bottomAnchor)
            case .normal:
                self.view.bottomAnchor.constraint(equalTo: trailingView.bottomAnchor)
            }
            
            NSLayoutConstraint.activate([
                topConstraint,
                leadingConstraint,
                bottomConstraint,
                self.view.trailingAnchor.constraint(equalTo: trailingView.trailingAnchor)
            ])
        }
        return self
    }
}

public extension UIViewController {

    @discardableResult
    func declarativeAsync(
        safeAreas: UIEdgeBools = .init(all: true),
        priorities: UIEdgePriorities = .init(all: .required),
        reset: Bool = false,
        @SingleUIViewBuilder outsideSafeAreaTop outsideSafeAreaTopBuilder: @escaping () async -> UIView? = { nil },
        @SingleUIViewBuilder outsideSafeAreaLeading outsideSafeAreaLeadingBuilder: @escaping () async -> UIView? = { nil },
        @SingleUIViewBuilder outsideSafeAreaBottom outsideSafeAreaBottomBuilder: @escaping () async -> UIView? = { nil },
        @SingleUIViewBuilder outsideSafeAreaTrailing outsideSafeAreaTrailingBuilder: @escaping () async -> UIView? = { nil },
        @SingleUIViewBuilder _ builder: @escaping () async -> UIView
    ) async -> Self {
        let view = await builder()
        if reset {
            self.view.subviews.forEach { $0.removeFromSuperview() }
        }
        self.view.edgesConstraints(view, safeAreas: safeAreas, priorities: priorities)
        
        //セーフエリアの上の外側
        if let topView = await outsideSafeAreaTopBuilder() {
            topView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(topView)
            NSLayoutConstraint.activate([
                topView.topAnchor.constraint(equalTo: self.view.topAnchor),
                topView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: topView.bottomAnchor),
                self.view.trailingAnchor.constraint(equalTo: topView.trailingAnchor)
            ])
        }
        
        //セーフエリアの左の外側
        if let leadingView = await outsideSafeAreaLeadingBuilder() {
            leadingView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(leadingView)
            NSLayoutConstraint.activate([
                leadingView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                leadingView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: leadingView.bottomAnchor),
                self.view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: leadingView.trailingAnchor)
            ])
        }
        
        //セーフエリアの下の外側
        if let bottomView = await outsideSafeAreaBottomBuilder() {
            bottomView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(bottomView)
            NSLayoutConstraint.activate([
                bottomView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                bottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.view.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
                self.view.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor)
            ])
        }
        
        //セーフエリアの右の外側
        if let trailingView = await outsideSafeAreaTrailingBuilder() {
            trailingView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(trailingView)
            NSLayoutConstraint.activate([
                trailingView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                trailingView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
                self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: trailingView.bottomAnchor),
                self.view.trailingAnchor.constraint(equalTo: trailingView.trailingAnchor)
            ])
        }
        return self
    }
    
    func declarative(
        safeAreas: UIEdgeBools = .init(all: true),
        priorities: UIEdgePriorities = .init(all: .required),
        reset: Bool = false,
        @SingleUIViewBuilder outsideSafeAreaTop outsideSafeAreaTopBuilder: @escaping () -> UIView? = { nil },
        @SingleUIViewBuilder outsideSafeAreaLeading outsideSafeAreaLeadingBuilder: @escaping () -> UIView? = { nil },
        @SingleUIViewBuilder outsideSafeAreaBottom outsideSafeAreaBottomBuilder: @escaping () -> UIView? = { nil },
        @SingleUIViewBuilder outsideSafeAreaTrailing outsideSafeAreaTrailingBuilder: @escaping () -> UIView? = { nil },
        @SingleUIViewBuilder _ builder: @escaping () -> UIView
    ) -> Self {
        let view = builder()
        if reset {
            self.view.subviews.forEach { $0.removeFromSuperview() }
        }
        self.view.edgesConstraints(view, safeAreas: safeAreas, priorities: priorities)
        
        //セーフエリアの上の外側
        if let topView = outsideSafeAreaTopBuilder() {
            topView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(topView)
            NSLayoutConstraint.activate([
                topView.topAnchor.constraint(equalTo: self.view.topAnchor),
                topView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: topView.bottomAnchor),
                self.view.trailingAnchor.constraint(equalTo: topView.trailingAnchor)
            ])
        }
        
        //セーフエリアの左の外側
        if let leadingView = outsideSafeAreaLeadingBuilder() {
            leadingView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(leadingView)
            NSLayoutConstraint.activate([
                leadingView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                leadingView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: leadingView.bottomAnchor),
                self.view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: leadingView.trailingAnchor)
            ])
        }
        
        //セーフエリアの下の外側
        if let bottomView = outsideSafeAreaBottomBuilder() {
            bottomView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(bottomView)
            NSLayoutConstraint.activate([
                bottomView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                bottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.view.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
                self.view.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor)
            ])
        }
        
        //セーフエリアの右の外側
        if let trailingView = outsideSafeAreaTrailingBuilder() {
            trailingView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(trailingView)
            NSLayoutConstraint.activate([
                trailingView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                trailingView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
                self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: trailingView.bottomAnchor),
                self.view.trailingAnchor.constraint(equalTo: trailingView.trailingAnchor)
            ])
        }
        
        return self
    }
}

public extension UIViewController {
        
    @discardableResult
    func applyView(_ configure: ((UIView) -> Void)) -> Self {
        configure(self.view)
        return self
    }
    
    @discardableResult
    func applyNavigationItem(_ configure: ((UINavigationItem) -> Void)) -> Self {
        configure(self.navigationItem)
        return self
    }
    
    @discardableResult
    func resetDeclarativeUIKitLayout() -> Self {
        self.view.subviews.forEach { $0.removeFromSuperview() }
        return self
    }
    
    func getView(tag: Int) -> UIView? {
        self.view.getView(tag: tag)
    }
}

//MARK: - Declarative method
public extension UIViewController {
    
    @discardableResult
    func apply(_ apply: ((Self) -> Void)) -> Self {
        apply(self)
        return self
    }
    
    @discardableResult
    func tabBarItem(_ tabBarItem: UITabBarItem) -> Self {
        self.tabBarItem = tabBarItem
        return self
    }
    
    @discardableResult
    func tabBarItem(_ tabBarItemBuilder: (() -> UITabBarItem)) -> Self {
        self.tabBarItem = tabBarItemBuilder()
        return self
    }
    
    @discardableResult
    func present(from: UIViewController, animated: Bool, completion: (() -> Void)? = nil) -> Self {
        from.present(self, animated: animated, completion: completion)
        return self
    }
}

@available(iOS 15.0, *)
public extension UIViewController {
    @discardableResult
    func applySheetPresentationController(_ configure: ((UISheetPresentationController) -> Void)) -> Self {
        if let sheet = sheetPresentationController {
            configure(sheet)
        }
        return self
    }
}
