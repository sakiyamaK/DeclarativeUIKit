import UIKit.UIView

@resultBuilder
public enum ArrayUIViewBuilder {
    public typealias Component = [Expression]
    public typealias Expression = UIView

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

@resultBuilder
public enum SingleUIViewBuilder {
    public typealias Component = UIView

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



