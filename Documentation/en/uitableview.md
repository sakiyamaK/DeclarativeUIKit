# UITableView

## function

### some default parameters

以下の標準パラメータは宣言的に記述できます

```swift
    func dataSource(_ dataSource: NSObject & UITableViewDataSource) -> Self

    func delegate(_ delegate: NSObject & UITableViewDelegate) -> Self

    func prefetchDataSource(_ delegate: NSObject & UITableViewDataSourcePrefetching) -> Self

    func dragDelegate(_ delegate: NSObject & UITableViewDragDelegate) -> Self

    func dropDelegate(_ delegate: NSObject & UITableViewDropDelegate) -> Self

    func registerCellClass(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String) -> Self

    func registerViewClass(_ viewClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String) -> Self
```

#### sample

```swift
self.declarative {
    UITableView()
        .delegate(self)
        .dataSource(self)
        .registerCellClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        .registerViewClass(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Header")
        .registerViewClass(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Footer")
}
```