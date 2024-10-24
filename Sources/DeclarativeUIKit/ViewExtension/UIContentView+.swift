//
//  UIContentView+.swift
//
//
//  Created by sakiyamaK on 2024/10/24.
//

import UIKit

@available(iOS 14.0, *)
public extension UIContentView {
    @discardableResult
    func configuration(_ configuration: UIContentConfiguration) -> Self {
        self.configuration = configuration
        return self
    }
}
