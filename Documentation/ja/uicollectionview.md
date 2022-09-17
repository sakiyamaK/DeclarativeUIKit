# UICollectionView

## initializer

### init with layout builder

#### 
```swift
    init(_ collectionViewLayoutBuilder: () -> UICollectionViewLayout)
```

|  parameter | 型 | description |
| ---- | ---- | ---- |
| collectionViewLayoutBuilder | () -> UICollectionViewLayout | `collectionViewLayout`に代入されるレイアウトを返す |


## function

### some default parameters

以下の標準パラメータは宣言的に記述できます

```swift
    func dataSource(_ dataSource: NSObject & UICollectionViewDataSource) -> Self

    func delegate(_ delegate: NSObject & UICollectionViewDelegate) -> Self

    func prefetchDataSource(_ delegate: NSObject & UICollectionViewDataSourcePrefetching) -> Self

    func dragDelegate(_ delegate: NSObject & UICollectionViewDragDelegate) -> Self

    func dropDelegate(_ delegate: NSObject & UICollectionViewDropDelegate) -> Self
    
    func registerCellClass(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String) -> Self
    
    func registerViewClass(_ viewClass: AnyClass?, forSupplementaryViewOfKind elementKind: String, withReuseIdentifier identifier: String) -> Self
```

#### sample

```swift
self.declarative {
    UICollectionView {
        UICollectionViewFlowLayout()
    }
    .dataSource(self)
    .delegate(self)
    .registerCellClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
}
```