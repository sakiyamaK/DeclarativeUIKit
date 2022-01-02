import UIKit.UIViewController
import UIKit

public extension UIViewController {
        
    func declarate(
        safeAreas: UIEdgeBools,
        priorities: UIEdgePriorities,
        @SingleUIViewBuilder outsideSafeAreaTop outsideSafeAreaTopBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaLeading outsideSafeAreaLeadingBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaBottom outsideSafeAreaBottomBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaTrailing outsideSafeAreaTrailingBuilder: () -> UIView?,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) {
        let view = builder()
        self.view.subviews.forEach { $0.removeFromSuperview() }
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
    }
    
    func declarate(
        safeAreas: UIEdgeBools,
        priorities: UIEdgePriorities,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) {
        self.declarate(
            safeAreas: safeAreas,
            priorities: priorities,
            outsideSafeAreaTop: {},
            outsideSafeAreaLeading: {},
            outsideSafeAreaBottom: {},
            outsideSafeAreaTrailing: {},
            builder
        )
    }
    
    func declarate(
        safeAreas: UIEdgeBools,
        @SingleUIViewBuilder outsideSafeAreaTop outsideSafeAreaTopBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaLeading outsideSafeAreaLeadingBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaBottom outsideSafeAreaBottomBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaTrailing outsideSafeAreaTrailingBuilder: () -> UIView?,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) {
        self.declarate(
            safeAreas: safeAreas,
            priorities: .init(all: .required),
            outsideSafeAreaTop: outsideSafeAreaTopBuilder,
            outsideSafeAreaLeading: outsideSafeAreaLeadingBuilder,
            outsideSafeAreaBottom: outsideSafeAreaBottomBuilder,
            outsideSafeAreaTrailing: outsideSafeAreaTrailingBuilder,
            builder
        )
    }

    func declarate(
        priorities: UIEdgePriorities,
        @SingleUIViewBuilder outsideSafeAreaTop outsideSafeAreaTopBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaLeading outsideSafeAreaLeadingBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaBottom outsideSafeAreaBottomBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaTrailing outsideSafeAreaTrailingBuilder: () -> UIView?,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) {
        self.declarate(
            safeAreas: .init(all: true),
            priorities: priorities,
            outsideSafeAreaTop: outsideSafeAreaTopBuilder,
            outsideSafeAreaLeading: outsideSafeAreaLeadingBuilder,
            outsideSafeAreaBottom: outsideSafeAreaBottomBuilder,
            outsideSafeAreaTrailing: outsideSafeAreaTrailingBuilder,
            builder
        )
    }

    func declarate(
        @SingleUIViewBuilder outsideSafeAreaTop outsideSafeAreaTopBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaLeading outsideSafeAreaLeadingBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaBottom outsideSafeAreaBottomBuilder: () -> UIView?,
        @SingleUIViewBuilder outsideSafeAreaTrailing outsideSafeAreaTrailingBuilder: () -> UIView?,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) {
        self.declarate(
            safeAreas: .init(all: true),
            priorities: .init(all: .required),
            outsideSafeAreaTop: outsideSafeAreaTopBuilder,
            outsideSafeAreaLeading: outsideSafeAreaLeadingBuilder,
            outsideSafeAreaBottom: outsideSafeAreaBottomBuilder,
            outsideSafeAreaTrailing: outsideSafeAreaTrailingBuilder,
            builder
        )
    }

    func declarate(
        priorities: UIEdgePriorities,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) {
        self.declarate(safeAreas: .init(), priorities: priorities, builder)
    }

    func declarate(
        safeAreas: UIEdgeBools,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) {
        self.declarate(safeAreas: safeAreas, priorities: .init(), builder)
    }

    func declarate(
        @SingleUIViewBuilder _ builder: () -> UIView
    ) {
        self.declarate(safeAreas: .init(), priorities: .init(), builder)
    }
    
    func getView(tag: Int) -> UIView? {
        self.view.getView(tag: tag)
    }
}
