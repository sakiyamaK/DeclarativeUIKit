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
    func declarative(
        layoutGuides: UIEdgeLayoutGuides,
        priorities: UIEdgePriorities,
        reset: Bool,
        @SingleUIViewBuilder outsideLayoutGuideTop outsideLayoutGuideTopBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideLayoutGuideLeading outsideLayoutGuideLeadingBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideLayoutGuideBottom outsideLayoutGuideBottomBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideLayoutGuideTrailing outsideLayoutGuideTrailingBuilder: () -> UIView?,
        @SingleUIViewBuilder _ builder: () -> UIView
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
    
    @discardableResult
    func declarative(
        layoutGuides: UIEdgeLayoutGuides,
        priorities: UIEdgePriorities,
        reset: Bool,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> Self {
        self.declarative(
            layoutGuides: layoutGuides,
            priorities: priorities,
            reset: reset,
            outsideLayoutGuideTop: {},
            outsideLayoutGuideLeading: {},
            outsideLayoutGuideBottom: {},
            outsideLayoutGuideTrailing: {},
            builder
        )
    }
    
    @discardableResult
    func declarative(
        layoutGuides: UIEdgeLayoutGuides,
        priorities: UIEdgePriorities,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> Self {
        self.declarative(
            layoutGuides: layoutGuides,
            priorities: priorities,
            reset: false,
            outsideLayoutGuideTop: {},
            outsideLayoutGuideLeading: {},
            outsideLayoutGuideBottom: {},
            outsideLayoutGuideTrailing: {},
            builder
        )
    }

    @discardableResult
    func declarative(
        layoutGuides: UIEdgeLayoutGuides,
        @SingleUIViewBuilder outsideLayoutGuideTop outsideLayoutGuideTopBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideLayoutGuideLeading outsideLayoutGuideLeadingBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideLayoutGuideBottom outsideLayoutGuideBottomBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideLayoutGuideTrailing outsideLayoutGuideTrailingBuilder: () -> UIView?,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> Self {
        self.declarative(
            layoutGuides: layoutGuides,
            priorities: .init(all: .required),
            reset: false,
            outsideLayoutGuideTop: outsideLayoutGuideTopBuilder,
            outsideLayoutGuideLeading: outsideLayoutGuideLeadingBuilder,
            outsideLayoutGuideBottom: outsideLayoutGuideBottomBuilder,
            outsideLayoutGuideTrailing: outsideLayoutGuideTrailingBuilder,
            builder
        )
    }
    
    @discardableResult
    func declarative(
        layoutGuides: UIEdgeLayoutGuides,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> Self {
        self.declarative(
            layoutGuides: layoutGuides,
            priorities: .init(all: .required),
            reset: false,
            outsideLayoutGuideTop: {},
            outsideLayoutGuideLeading: {},
            outsideLayoutGuideBottom: {},
            outsideLayoutGuideTrailing: {},
            builder
        )
    }
}

public extension UIViewController {
    
    @discardableResult
    /// レイアウトを宣言的に書くメソッド
    /// - Parameters:
    ///   - safeAreas: 四隅をセーフエリア内に収めるか
    ///   - priorities: 四隅の制約の優先度
    ///   - reset: すでに設定済みのViewを全て外すか
    ///   - outsideSafeAreaTop: セーフエリアの上辺の外側のレイアウト
    ///   - outsideSafeAreaLeading: セーフエリアの文頭辺の外側のレイアウト
    ///   - outsideSafeAreaBottom: セーフエリアの文末辺の外側のレイアウト
    ///   - outsideSafeAreaTrailing: セーフエリアの下辺の外側のレイアウト
    ///   - _: セーフエリ内のレイアウト
    /// - Returns: Self
    func declarative(
        safeAreas: UIEdgeBools,
        priorities: UIEdgePriorities,
        reset: Bool,
        @SingleUIViewBuilder outsideSafeAreaTop outsideSafeAreaTopBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaLeading outsideSafeAreaLeadingBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaBottom outsideSafeAreaBottomBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaTrailing outsideSafeAreaTrailingBuilder: () -> UIView?,
        @SingleUIViewBuilder _ builder: () -> UIView
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
    
    @discardableResult
    func declarative(
        safeAreas: UIEdgeBools,
        priorities: UIEdgePriorities,
        reset: Bool,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> Self {
        self.declarative(
            safeAreas: safeAreas,
            priorities: priorities,
            reset: reset,
            outsideSafeAreaTop: {},
            outsideSafeAreaLeading: {},
            outsideSafeAreaBottom: {},
            outsideSafeAreaTrailing: {},
            builder
        )
    }
    
    @discardableResult
    func declarative(
        safeAreas: UIEdgeBools,
        @SingleUIViewBuilder outsideSafeAreaTop outsideSafeAreaTopBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaLeading outsideSafeAreaLeadingBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaBottom outsideSafeAreaBottomBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaTrailing outsideSafeAreaTrailingBuilder: () -> UIView?,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> Self {
        self.declarative(
            safeAreas: safeAreas,
            priorities: .init(all: .required),
            reset: false,
            outsideSafeAreaTop: outsideSafeAreaTopBuilder,
            outsideSafeAreaLeading: outsideSafeAreaLeadingBuilder,
            outsideSafeAreaBottom: outsideSafeAreaBottomBuilder,
            outsideSafeAreaTrailing: outsideSafeAreaTrailingBuilder,
            builder
        )
    }
    
    @discardableResult
    func declarative(
        priorities: UIEdgePriorities,
        @SingleUIViewBuilder outsideSafeAreaTop outsideSafeAreaTopBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaLeading outsideSafeAreaLeadingBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaBottom outsideSafeAreaBottomBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaTrailing outsideSafeAreaTrailingBuilder: () -> UIView?,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> Self {
        self.declarative(
            safeAreas: .init(all: true),
            priorities: priorities,
            reset: false,
            outsideSafeAreaTop: outsideSafeAreaTopBuilder,
            outsideSafeAreaLeading: outsideSafeAreaLeadingBuilder,
            outsideSafeAreaBottom: outsideSafeAreaBottomBuilder,
            outsideSafeAreaTrailing: outsideSafeAreaTrailingBuilder,
            builder
        )
    }
    
    @discardableResult
    func declarative(
        reset: Bool,
        @SingleUIViewBuilder outsideSafeAreaTop outsideSafeAreaTopBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaLeading outsideSafeAreaLeadingBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaBottom outsideSafeAreaBottomBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaTrailing outsideSafeAreaTrailingBuilder: () -> UIView?,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> Self {
        self.declarative(
            safeAreas: .init(all: true),
            priorities: .init(all: .required),
            reset: reset,
            outsideSafeAreaTop: outsideSafeAreaTopBuilder,
            outsideSafeAreaLeading: outsideSafeAreaLeadingBuilder,
            outsideSafeAreaBottom: outsideSafeAreaBottomBuilder,
            outsideSafeAreaTrailing: outsideSafeAreaTrailingBuilder,
            builder
        )
    }
    
    @discardableResult
    func declarative(
        @SingleUIViewBuilder outsideSafeAreaTop outsideSafeAreaTopBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaLeading outsideSafeAreaLeadingBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaBottom outsideSafeAreaBottomBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaTrailing outsideSafeAreaTrailingBuilder: () -> UIView?,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> Self {
        self.declarative(
            safeAreas: .init(all: true),
            priorities: .init(all: .required),
            reset: false,
            outsideSafeAreaTop: outsideSafeAreaTopBuilder,
            outsideSafeAreaLeading: outsideSafeAreaLeadingBuilder,
            outsideSafeAreaBottom: outsideSafeAreaBottomBuilder,
            outsideSafeAreaTrailing: outsideSafeAreaTrailingBuilder,
            builder
        )
    }
    
    @discardableResult
    func declarative(
        priorities: UIEdgePriorities,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> Self {
        self.declarative(safeAreas: .init(), priorities: priorities, reset: false, builder)
    }
    
    @discardableResult
    func declarative(
        safeAreas: UIEdgeBools,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> Self {
        self.declarative(safeAreas: safeAreas, priorities: .init(), reset: false, builder)
    }
    
    @discardableResult
    func declarative(
        safeAreas: UIEdgeBools,
        reset: Bool,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> Self {
        self.declarative(safeAreas: safeAreas, priorities: .init(), reset: reset, builder)
    }
    
    @discardableResult
    func declarative(
        reset: Bool,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> Self {
        self.declarative(safeAreas: .init(), priorities: .init(), reset: reset, builder)
    }
    
    @discardableResult
    /// レイアウトを宣言的に書くメソッド
    /// - Parameter _: セーフエリ内のレイアウト
    /// - Returns: Self
    func declarative(
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> Self {
        self.declarative(safeAreas: .init(), priorities: .init(), reset: false, builder)
    }
    
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
