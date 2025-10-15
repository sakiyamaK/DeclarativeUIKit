//
//  UIContentView+.swift
//
//
//  Created by sakiyamaK on 2024/10/24.
//

import UIKit

public extension UIContentView {
    @discardableResult
    func configuration(_ configuration: UIContentConfiguration) -> Self {
        self.configuration = configuration
        return self
    }
}
