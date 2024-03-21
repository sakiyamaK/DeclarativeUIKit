//
//  UISwipeActionsConfiguration+.swift
//
//
//  Created by sakiyamaK on 2024/03/19.
//

import UIKit

public extension UISwipeActionsConfiguration {
    @discardableResult
    func performsFirstActionWithFullSwipe(_ performsFirstActionWithFullSwipe: Bool) -> Self {
        self.performsFirstActionWithFullSwipe = performsFirstActionWithFullSwipe
        return self
    }
}

