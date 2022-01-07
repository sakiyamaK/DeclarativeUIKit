import UIKit.UICollectionView

//MARK: - instance
public extension UICollectionView {
    convenience init(_ collectionViewLayout: UICollectionViewLayout) {
        self.init(frame: .zero, collectionViewLayout: collectionViewLayout)
    }
    
    convenience init(_ collectionViewLayoutBuilder: () -> UICollectionViewLayout) {
        self.init(frame: .zero, collectionViewLayout: collectionViewLayoutBuilder())
    }
}

//MARK: - Declarative method
public extension UICollectionView {
    @discardableResult
    func dataSource(_ dataSource: NSObject & UICollectionViewDataSource) -> Self {
        self.dataSource = dataSource
        return self
    }

    @discardableResult
    func delegate(_ delegate: NSObject & UICollectionViewDelegate) -> Self {
        self.delegate = delegate
        return self
    }

    @discardableResult
    func prefetchDataSource(_ delegate: NSObject & UICollectionViewDataSourcePrefetching) -> Self {
        self.prefetchDataSource = delegate
        return self
    }

    @discardableResult
    func dragDelegate(_ delegate: NSObject & UICollectionViewDragDelegate) -> Self {
        self.dragDelegate = delegate
        return self
    }

    @discardableResult
    func dropDelegate(_ delegate: NSObject & UICollectionViewDropDelegate) -> Self {
        self.dropDelegate = delegate
        return self
    }
    
    @discardableResult
    func registerCellClass(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String) -> Self {
        self.register(cellClass, forCellWithReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult
    func registerViewClass(_ viewClass: AnyClass?, forSupplementaryViewOfKind elementKind: String, withReuseIdentifier identifier: String) -> Self {
        self.register(viewClass, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: identifier)
        return self
    }
}
