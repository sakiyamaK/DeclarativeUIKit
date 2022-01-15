# Parameter

ライブラリ内で利用するオリジナルのパラメータやextensionです

## UIEdgeInsets

初期化パラメータが追加されています

### init(all:) 

```swift
  init(all: CGFloat)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| all | CGFloat | `UIEdgesInsets`のパラメータの`top`,`left`,`bottom`,`right`を`all`に設定する |

### init(vertical:) 

```swift
  init(vertical: CGFloat)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| vertical | CGFloat | `UIEdgesInsets`のパラメータの`top`,`bottom`を`vertical`に設定する |

### init(horizontal:) 

```swift
  init(horizontal: CGFloat)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| horizontal | CGFloat | `UIEdgesInsets`のパラメータの`left`,`right`を`horizontal`に設定する |

## UIEdgeBools

`UIEdgeInsets`の`Bool`版です
`UIViewController.decrative`のパラメータで使われます

### init(top: , leading, bottom, trailing) 

```swift
  init(top: Bool = true, leading: Bool = true, bottom: Bool = true, trailing: Bool = true)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| top | Bool | 初期値は`true`です |
| leading | Bool | 初期値は`true`です |
| bottom | Bool | 初期値は`true`です |
| trailing | Bool | 初期値は`true`です |

### init(all:) 

```swift
  init(all: Bool)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| all | Bool | `UIEdgeBools`のパラメータの`top`,`leading`,`bottom`,`trailing`を`all`に設定する |

### init(vertical:) 

```swift
  init(vertical: Bool)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| vertical | Bool | `UIEdgeBools`のパラメータの`top`,`bottom`を`vertical`に設定する |

### init(horizontal:) 

```swift
  init(horizontal: Bool)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| horizontal | Bool | `UIEdgeBools`のパラメータの`leading`,`trailing`を`horizontal`に設定する |

## UIEdgePriorities

`UIEdgeInsets`の`UILayoutPriority`版です
`UIViewController.decrative`のパラメータで使われます

### init(top: , leading, bottom, trailing) 

```swift
  init(top: UILayoutPriority = .required, leading: UILayoutPriority = .required, bottom: UILayoutPriority = .required, trailing: UILayoutPriority = .required)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| top | UILayoutPriority | 初期値は`required`です |
| leading | UILayoutPriority | 初期値は`required`です |
| bottom | UILayoutPriority | 初期値は`required`です |
| trailing | UILayoutPriority | 初期値は`required`です |

### init(all:) 

```swift
  init(all: UILayoutPriority)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| all | UILayoutPriority | `UIEdgePriorities`のパラメータの`top`,`leading`,`bottom`,`trailing`を`all`に設定する |

### init(vertical:) 

```swift
  init(vertical: UILayoutPriority)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| vertical | UILayoutPriority | `UIEdgePriorities`のパラメータの`top`,`bottom`を`vertical`に設定する |

### init(horizontal:) 

```swift
  init(horizontal: UILayoutPriority)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| horizontal | UILayoutPriority | `UIEdgePriorities`のパラメータの`leading`,`trailing`を`horizontal`に設定する |