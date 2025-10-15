//
//  FloatingActionViewPosition.swift
//  DeclarativeUIKit
//
//  Created by sakiyamaK on 2025/01/07.
//

import UIKit

//MARK: - floating action view
import CoreGraphics

public enum FloatingActionViewPosition {
    case
    leadingTop(CGPoint = .zero), centerTop(CGPoint = .zero), trailingTop(CGPoint = .zero),
    leadingCenter(CGPoint = .zero), centerCenter(CGPoint = .zero), trailingCenter(CGPoint = .zero),
    leadingBottom(CGPoint = .zero), centerBottom(CGPoint = .zero), trailingBottom(CGPoint = .zero),
    topLeading(CGPoint = .zero), topCenter(CGPoint = .zero), topTrailing(CGPoint = .zero),
    bottomLeading(CGPoint = .zero), bottomCenter(CGPoint = .zero), bottomTrailing(CGPoint = .zero),
    centerLeading(CGPoint = .zero), centerTrailing(CGPoint = .zero)
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
    public static var leadingBottom: FloatingActionViewPosition {
        .leadingBottom()
    }
    public static var centerBottom: FloatingActionViewPosition {
        .centerBottom()
    }
    public static var trailingBottom: FloatingActionViewPosition {
        .trailingBottom()
    }
    public static var topLeading: FloatingActionViewPosition {
        .topLeading()
    }
    public static var topCenter: FloatingActionViewPosition {
        .topCenter()
    }
    public static var topTrailing: FloatingActionViewPosition {
        .topTrailing()
    }
    public static var bottomLeading: FloatingActionViewPosition {
        .bottomLeading()
    }
    public static var bottomCenter: FloatingActionViewPosition {
        .bottomCenter()
    }
    public static var bottomTrailing: FloatingActionViewPosition {
        .bottomTrailing()
    }
    public static var centerLeading: FloatingActionViewPosition {
        .centerLeading()
    }
    public static var centerTrailing: FloatingActionViewPosition {
        .centerTrailing()
    }
}
