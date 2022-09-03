import UIKit.NSLayoutConstraint

public struct UIContentPriorities {
    public var huggingVertical: UILayoutPriority?
    public var huggingHorizontal: UILayoutPriority?
    public var compressionResistanceVertical: UILayoutPriority?
    public var compressionResistanceHorizontal: UILayoutPriority?
    
    public init(huggingVertical: UILayoutPriority? = nil, huggingHorizontal: UILayoutPriority? = nil, compressionResistanceVertical: UILayoutPriority? = nil, compressionResistanceHorizontal: UILayoutPriority? = nil) {
        self.huggingVertical = huggingVertical
        self.huggingHorizontal = huggingHorizontal
        self.compressionResistanceVertical = compressionResistanceVertical
        self.compressionResistanceHorizontal = compressionResistanceHorizontal
    }
    
    public init(all: UILayoutPriority) {
        self.init(huggingVertical: all, huggingHorizontal: all, compressionResistanceVertical: all, compressionResistanceHorizontal: all)
    }

    public init(hugging: UILayoutPriority) {
        self.init(huggingVertical: hugging, huggingHorizontal: hugging)
    }
    
    public init(compressionResistance: UILayoutPriority) {
        self.init(compressionResistanceVertical: compressionResistance, compressionResistanceHorizontal: compressionResistance)
    }
    
    public init(vertical: UILayoutPriority) {
        self.init(huggingVertical: vertical, compressionResistanceVertical: vertical)
    }

    public init(horizontal: UILayoutPriority) {
        self.init(huggingHorizontal: horizontal, compressionResistanceHorizontal: horizontal)
    }

}
