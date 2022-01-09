import UIKit.UITableView

//MARK: - Declarative method
public extension UITableView {
    @discardableResult
    func dataSource(_ dataSource: NSObject & UITableViewDataSource) -> Self {
        self.dataSource = dataSource
        return self
    }

    @discardableResult
    func delegate(_ delegate: NSObject & UITableViewDelegate) -> Self {
        self.delegate = delegate
        return self
    }

    @discardableResult
    func prefetchDataSource(_ delegate: NSObject & UITableViewDataSourcePrefetching) -> Self {
        self.prefetchDataSource = delegate
        return self
    }

    @discardableResult
    func dragDelegate(_ delegate: NSObject & UITableViewDragDelegate) -> Self {
        self.dragDelegate = delegate
        return self
    }

    @discardableResult
    func dropDelegate(_ delegate: NSObject & UITableViewDropDelegate) -> Self {
        self.dropDelegate = delegate
        return self
    }
    
    @discardableResult
    func registerCellClass(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String) -> Self {
        self.register(cellClass, forCellReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult
    func registerViewClass(_ viewClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String) -> Self {
        self.register(viewClass, forHeaderFooterViewReuseIdentifier: identifier)
        return self
    }
}
