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