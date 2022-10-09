//
//  UIMenuBuilder.swift
//  
//
//  Created by sakiyamaK on 2022/10/09.
//

import UIKit.UIMenuElement

@available(iOS 13.0, *)
@resultBuilder
public enum ArrayUIMenuElementBuilder {
    public typealias Component = [Expression]
    public typealias Expression = UIMenuElement

    public static func buildExpression(_ element: Expression) -> Component {
        return [element]
    }

    public static func buildExpression(_ component: Component) -> Component {
        return component
    }

    public static func buildOptional(_ component: Component?) -> Component {
        guard let component = component else { return [] }
        return component
    }

    public static func buildEither(first component: Component) -> Component {
        return component
    }

    public static func buildEither(second component: Component) -> Component {
        return component
    }

    public static func buildArray(_ components: [Component]) -> Component {
        return Array(components.joined())
    }

    public static func buildBlock(_ components: Component...) -> Component {
        return Array(components.joined())
    }
    
    public static func buildBlock() -> Component {
        return []
    }
}

@available(iOS 13.0, *)
@resultBuilder
public enum SingleUIMenuElementBuilder {
    public typealias Component = UIMenuElement

    public static func buildEither(first component: Component) -> Component {
        return component
    }

    public static func buildEither(second component: Component) -> Component {
        return component
    }

    public static func buildBlock(_ component: Component) -> Component {
        return component
    }
    
    public static func buildBlock() -> Component? {
        return nil
    }
}
