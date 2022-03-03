//
//  File.swift
//  
//
//  Created by sakiyamaK on 2022/03/03.
//

import UIKit.UIView

final class HelperCustomSpacingView: UIView {
    private(set) var customSpacing: CGFloat = 0
    convenience init(customSpacing: CGFloat = 0) {
        self.init(frame: .zero)
        self.customSpacing = customSpacing
    }
}
