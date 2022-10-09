//
//  UIMenu+.swift
//  
//
//  Created by sakiyamaK on 2022/10/09.
//

import UIKit.UIMenu

@available(iOS 13.0, *)
public extension UIMenu {
    convenience init(title: String? = nil, image: UIImage? = nil, identifier: Identifier? = nil, options: Options = .displayInline, @ArrayUIMenuElementBuilder _ childrenBuilder: () -> [UIMenuElement?]) {
        self.init(title: title ?? "", image: image, identifier: identifier, options: options, children: childrenBuilder().compactMap({ $0 }))
    }
}
