import UIKit.UIStackView
import UIKit.UIViewController

public extension UIViewController {
    func build(
        safeAreas: TopLeadingBottomTrailingSafeArea,
        priorities: TopLeadingBottomTrailingPriority,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) {
        let view = builder()
        self.view.subviews.forEach { $0.removeFromSuperview() }
        self.view.edgesConstraints(view, safeAreas: safeAreas, priorities: priorities)
    }
    
    func build(
        priorities: TopLeadingBottomTrailingPriority,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) {
        self.build(safeAreas: .init(), priorities: priorities, builder)
    }

    func build(
        safeAreas: TopLeadingBottomTrailingSafeArea,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) {
        self.build(safeAreas: safeAreas, priorities: .init(), builder)
    }

    func build(
        @SingleUIViewBuilder _ builder: () -> UIView
    ) {
        self.build(safeAreas: .init(), priorities: .init(), builder)
    }
    
    func getView(tag: Int) -> UIView? {
        self.view.getView(tag: tag)
    }
}
