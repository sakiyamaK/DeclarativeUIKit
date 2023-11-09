import UIKit.UIViewController

public extension UIViewController {
        
    @discardableResult
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
