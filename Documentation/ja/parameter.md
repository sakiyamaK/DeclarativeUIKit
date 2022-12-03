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

### init(top:, leading, bottom, trailing) 

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

## UIContentPriorities

`UIView`の`ContentHuggingPriority`と`ContentCompressionResistancePriority`を制御するパラメータです
`UIView.contentPriorities`のパラメータで使われます

### init(huggingVertical:, huggingHorizontal, compressionResistanceVertical, compressionResistanceHorizontal) 

```swift
  init(huggingVertical: UILayoutPriority? = nil, huggingHorizontal: UILayoutPriority? = nil, compressionResistanceVertical: UILayoutPriority? = nil, compressionResistanceHorizontal: UILayoutPriority? = nil)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| huggingVertical | UILayoutPriority | `UIView`の`ContentHuggingPriority`の`vertical`を設定する |
| huggingHorizontal | UILayoutPriority | `UIView`の`ContentHuggingPriority`の`horizontal`を設定する |
| compressionResistanceVertical | UILayoutPriority | `UIView`の`CompressionResistance`の`vertical`を設定する |
| compressionResistanceHorizontal | UILayoutPriority | `UIView`の`CompressionResistance`の`horizontal`を設定する |

### init(all:)
```swift
  init(all: UILayoutPriority)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| all | UILayoutPriority | `UIContentPriorities`のパラメータの`huggingVertical`,`huggingHorizontal`, `compressionResistanceVertical`, `compressionResistanceHorizontal`を設定する |

### init(hugging:)
```swift
  init(hugging: UILayoutPriority)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| hugging | UILayoutPriority | `UIContentPriorities`のパラメータの`huggingVertical`,`huggingHorizontal`を設定する |

### init(compressionResistance:)
```swift
  init(compressionResistance: UILayoutPriority)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| compressionResistance | UILayoutPriority | `UIContentPriorities`のパラメータの`compressionResistanceVertical`,`compressionResistanceHorizontal`を設定する |

### init(vertical:)
```swift
  init(vertical: UILayoutPriority)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| vertical | UILayoutPriority | `UIContentPriorities`のパラメータの`huggingVertical`,`compressionResistanceVertical`を設定する |


### init(horizontal:)
```swift
  init(horizontal: UILayoutPriority)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| horizontal | UILayoutPriority | `UIContentPriorities`のパラメータの`huggingHorizontal`,`compressionResistanceHorizontal`を設定する |

## UITabBarAppearanceType 

`UITabBar`の`appearance`の種類を指定するEnumです
`standard`, `scrollEdge`を指定できます

## UITabBarItemAppearanceType
`UITabBarItem`の`appearance`の種類を指定するEnumです
`stackedLayoutAppearance`, `inlineLayoutAppearance`, `compactInlineLayoutAppearance`を指定できます

## UITabBarItemStateAppearanceType 

`UITabBarItem`の`appearance`の`state`の種類を指定するEnumです
`normal`, `selected`, `disabled`, `focused`を指定できます

## UIBarAppearanceConfigureBackgroundType

`UIBarAppearance`の背景の`appearance`の種類を指定するEnumです
`default`, `opaqueBackground`, `transparentBackground`を指定できます
