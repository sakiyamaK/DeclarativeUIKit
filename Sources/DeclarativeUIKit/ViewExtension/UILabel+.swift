import UIKit.UILabel

//MARK: -
private extension UILabel {
    @discardableResult
    func setup(text: String?) -> Self {
        guard let text else {
            self.text = nil
            self.attributedText = nil
            return self
        }
        self.text = text
        return self
    }

    @discardableResult
    func setup(attributeText: NSAttributedString?) -> Self {
        guard let attributeText else {
            self.text = nil
            self.attributedText = nil
            return self
        }
        self.attributedText = attributeText
        return self
    }
}

//MARK: -
public extension UILabel {
    convenience init(_ text: String?) {
        self.init(frame: .zero)
        self.text(text)
    }
        
    convenience init(_ text: String?, _ apply: (Self) -> Void) {
        self.init(frame: .zero)
        self.text(text)
        apply(self)
    }

    convenience init(_ text: NSAttributedString?) {
        self.init(frame: .zero)
        self.text(text)
    }
    
    convenience init(_ text: NSAttributedString?, _ apply: (Self) -> Void) {
        self.init(frame: .zero)
        self.text(text)
        apply(self)
    }
}

//MARK: - Declarative method
public extension UILabel {

    @discardableResult
    func text(_ text: String?) -> Self {
        self.setup(text: text)
    }
    
    @discardableResult
    func text(_ attributeText: NSAttributedString?) -> Self {
        self.setup(attributeText: attributeText)
    }
    
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    func numberOfLines(_ numberOfLines: Int) -> Self {
        self.numberOfLines = numberOfLines
        return self
    }

    @discardableResult
    func textColor(_ textColor: UIColor) -> Self {
        self.textColor = textColor
        return self
    }

    @discardableResult
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }
}
