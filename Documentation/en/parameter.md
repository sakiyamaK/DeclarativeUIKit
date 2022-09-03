# Parameter

Original parameters and extensions to be used within the library.

## UIEdgeInsets

Initialization parameters have been added

### init(all:) 

```swift
  init(all: CGFloat)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| all | CGFloat | set `top`,`left`,`bottom`,`right` of `UIEdgesInsets` parameter to `all`. |

### init(vertical:) 

```swift
  init(vertical: CGFloat)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| vertical | CGFloat | Set `top` and `bottom` of `UIEdgesInsets` parameters to `vertical`. |

### init(horizontal:) 

```swift
  init(horizontal: CGFloat)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| horizontal | CGFloat | set `left` and `right` parameters of `UIEdgesInsets` to `horizontal`. |

## UIEdgeBools

A `Bool` version of `UIEdgeInsets`.
Used in `UIViewController.directive` parameter.

### init(top: , leading, bottom, trailing) 

```swift
  init(top: Bool = true, leading: Bool = true, bottom: Bool = true, trailing: Bool = true)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| top | Bool | The default value is `true` |
| leading | Bool | The default value is `true` |
| bottom | Bool | The default value is `true` |
| trailing | Bool | The default value is `true` |

### init(all:) 

```swift
  init(all: Bool)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| all | Bool | Set `top`,`leading`,`bottom`,`trailing` parameters of `UIEdgeBools` to `all`. |

### init(vertical:) 

```swift
  init(vertical: Bool)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| vertical | Bool | Set `top` and `bottom` of `UIEdgeBools` parameters to `vertical`. |

### init(horizontal:) 

```swift
  init(horizontal: Bool)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| horizontal | Bool | Set `leading` and `trailing` parameters of `UIEdgeBools` to `horizontal`. |

## UIEdgePriorities

UILayoutPriority` version of `UIEdgeInsets`.
Used in `UIViewController.directive` parameter.

### init(top: , leading, bottom, trailing) 

```swift
  init(top: UILayoutPriority = .required, leading: UILayoutPriority = .required, bottom: UILayoutPriority = .required, trailing: UILayoutPriority = .required)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| top | UILayoutPriority | The default value is `required` |
| leading | UILayoutPriority | The default value is `required` |
| bottom | UILayoutPriority | The default value is `required` |
| trailing | UILayoutPriority | The default value is `required` |

### init(all:) 

```swift
  init(all: UILayoutPriority)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| all | UILayoutPriority | Set `top`,`leading`,`bottom`,`trailing` parameters of `UIEdgePriorities` to `all`. |

### init(vertical:) 

```swift
  init(vertical: UILayoutPriority)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| vertical | UILayoutPriority | Set `top` and `bottom` of `UIEdgePriorities` parameter to `vertical`. |

### init(horizontal:) 

```swift
  init(horizontal: UILayoutPriority)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| horizontal | UILayoutPriority | Set `leading` and `trailing` parameters of `UIEdgePriorities` to `horizontal`. |

## UIContentPriorities

`UIView`の`ContentHuggingPriority`と`ContentCompressionResistancePriority`を制御するパラメータです
`UIView.contentPriorities`のパラメータで使われます

### init(huggingVertical:, huggingHorizontal, compressionResistanceVertical, compressionResistanceHorizontal) 

```swift
  init(huggingVertical: UILayoutPriority? = nil, huggingHorizontal: UILayoutPriority? = nil, compressionResistanceVertical: UILayoutPriority? = nil, compressionResistanceHorizontal: UILayoutPriority? = nil)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| huggingVertical | UILayoutPriority | Set `vertical` of `ContentHuggingPriority` in `UIView`. |
| huggingHorizontal | UILayoutPriority | Set `horizontal` of `ContentHuggingPriority` in `UIView`. |
| compressionResistanceVertical | UILayoutPriority | Set `vertical` of `CompressionResistance` in `UIView`. |
| compressionResistanceHorizontal | UILayoutPriority | Set `horizontal` of `CompressionResistance` in `UIView`. |

### init(all:)
```swift
  init(all: UILayoutPriority)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| all | UILayoutPriority | Sets the `UIContentPriorities` parameters `huggingVertical`,`huggingHorizontal`, `compressionResistanceVertical`, `compressionResistanceHorizontal` parameters. |

### init(hugging:)
```swift
  init(hugging: UILayoutPriority)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| hugging | UILayoutPriority | Sets the `UIContentPriorities` parameters `huggingVertical`,`huggingHorizontal` parameters. |

### init(compressionResistance:)
```swift
  init(compressionResistance: UILayoutPriority)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| compressionResistance | UILayoutPriority | Sets the `UIContentPriorities` parameters `compressionResistanceVertical`, `compressionResistanceHorizontal` parameters. |

### init(vertical:)
```swift
  init(vertical: UILayoutPriority)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| vertical | UILayoutPriority | Sets the `UIContentPriorities` parameters `huggingVertical`, `compressionResistanceVertical` parameters. |


### init(horizontal:)
```swift
  init(horizontal: UILayoutPriority)
```
|  parameter | 型 | description |
| ---- | ---- | ---- |
| horizontal | UILayoutPriority | Sets the `UIContentPriorities` parameters `huggingHorizontal`, `compressionResistanceHorizontal` parameters. |