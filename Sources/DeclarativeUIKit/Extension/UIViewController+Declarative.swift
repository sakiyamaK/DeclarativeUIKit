import UIKit.UIStackView
import UIKit.UIViewController

public extension UIViewController {
    func declarate(
        safeAreas: TopLeadingBottomTrailingSafeArea,
        priorities: TopLeadingBottomTrailingPriority,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) {
        let view = builder()
        self.view.subviews.forEach { $0.removeFromSuperview() }
        self.view.edgesConstraints(view, safeAreas: safeAreas, priorities: priorities)
    }
    
    func declarate(
        priorities: TopLeadingBottomTrailingPriority,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) {
        self.declarate(safeAreas: .init(), priorities: priorities, builder)
    }

    func declarate(
        safeAreas: TopLeadingBottomTrailingSafeArea,
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
