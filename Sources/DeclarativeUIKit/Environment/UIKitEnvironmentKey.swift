
import UIKit

public protocol UIKitEnvironmentKey {
    associatedtype Value
    static var defaultValue: Self.Value { get }
}
