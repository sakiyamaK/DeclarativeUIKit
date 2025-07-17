# DeclarativeUIKit Project Context

## 1. Project Overview

**DeclarativeUIKit** is a Swift library that enables developers to write UI code for UIKit in a declarative, SwiftUI-like style. The primary goal is to improve readability and maintainability by using method chaining (a fluent interface) and result builders, reducing the verbosity of traditional UIKit development.

**Core Concepts:**
- **Fluent Interface:** Most methods on UIKit extensions return `Self`, allowing for chaining of configuration calls (e.g., `UILabel().text("Hello").textColor(.blue)`).
- **Result Builders:** `@resultBuilder`s like `ArrayUIViewBuilder` are used to declaratively build view hierarchies, especially for `UIStackView` (`vStack`, `hStack`).
- **Layout Abstractions:** Provides simplified methods for creating Auto Layout constraints, including safe area-aware layout helpers.

## 2. Key Components (Source Code Structure)

The source code is organized under `Sources/DeclarativeUIKit/` with the following key directories:

- `ViewExtension/`: Contains `extension` files for `UIView` and its subclasses (e.g., `UILabel+`, `UIButton+`). Each file adds fluent-style methods for modifying the view's properties.
- `ControllerExtension/`: Similar to `ViewExtension`, but for `UIViewController` and its subclasses (e.g., `UIViewController+`, `UITabBarController+`).
- `Builder/`: Implements `@resultBuilder`s (`ArrayUIViewBuilder`, `ArrayUIViewControllerBuilder`, etc.) that enable declarative collection-like syntax.
- `Helper/`: Contains supporting code, such as `ActionHandler` for closures in target-action patterns, and helper structs for layout like `UIEdgeBools` and `UIEdgePriorities`.
- `Appearance/`: Contains extensions for appearance-related classes like `UIBarAppearance`.

## 3. Development Guidelines

### Adding a New Feature (e.g., Supporting a new UIView)
1.  Create a new file in `Sources/DeclarativeUIKit/ViewExtension/` named `TheUIViewSubclass+.swift`.
2.  Extend the class with methods that modify its properties and return `Self`.
3.  Follow the existing patterns for method naming and parameter conventions.
4.  Add a convenience initializer if it simplifies common use cases.
5.  Update the `DeclarativeUIKitDemo` app to include a usage example of the new feature.
6.  Add corresponding documentation in both `Documentation/en/` and `Documentation/ja/`.

### Testing
- The project is a Swift Package. Use the `swift test` command to run unit tests from the command line, or run them through Xcode.
- For visual changes, add examples to the `DeclarativeUIKitDemo` project to verify behavior.

### Documentation
- The project maintains documentation in both English (`Documentation/en/`) and Japanese (`Documentation/ja/`).
- When adding a new feature or changing an existing one, update the corresponding markdown files in both languages.

## 4. Coding Conventions

- **File Naming:** Extensions for a class `MyClass` should be in a file named `MyClass+.swift`. Deprecated methods should be moved to `MyClass+deprecated.swift`.
- **API Design:**
    - Configuration methods should be short, clear, and return `Self` to be chainable.
    - Use `@discardableResult` for all fluent interface methods.
    - Prefer creating specific helper structs (like `UIEdgePriorities`) for complex, multi-parameter configurations to keep method signatures clean.
- **Deprecation:** When deprecating a method, use the `@available(*, deprecated, message: "...")` attribute and move the implementation to the corresponding `+deprecated.swift` file.
