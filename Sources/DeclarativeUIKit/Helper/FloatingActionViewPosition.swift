//
//  FloatingActionViewPosition.swift
//  DeclarativeUIKit
//
//  Created by sakiyamaK on 2025/01/07.
//

import UIKit

//MARK: - floating action view
public enum FloatingActionViewPosition {
    case leadingTop(CGPoint = .zero), centerTop(CGPoint = .zero), trailingTop(CGPoint = .zero),
         leadingCenter(CGPoint = .zero), centerCenter(CGPoint = .zero), trailingCenter(CGPoint = .zero),
         leadingBttom(CGPoint = .zero), centerBottom(CGPoint = .zero), trailingBottom(CGPoint = .zero)
    
    public static var leadingTop: FloatingActionViewPosition {
        .leadingTop()
    }    
    public static var centerTop: FloatingActionViewPosition {
        .centerTop()
    }
    public static var trailingTop: FloatingActionViewPosition {
        .trailingTop()
    }
    public static var leadingCenter: FloatingActionViewPosition {
        .leadingCenter()
    }
    public static var centerCenter: FloatingActionViewPosition {
        .centerCenter()
    }
    public static var trailingCenter: FloatingActionViewPosition {
        .trailingCenter()
    }
    public static var leadingBttom: FloatingActionViewPosition {
        .leadingBttom()
    }
    public static var centerBottom: FloatingActionViewPosition {
        .centerBottom()
    }
    public static var trailingBottom: FloatingActionViewPosition {
        .trailingBottom()
    }
}
