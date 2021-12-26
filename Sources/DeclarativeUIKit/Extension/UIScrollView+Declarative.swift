//
//  File.swift
//  
//
//  Created by sakiyamaK on 2021/12/26.
//

import UIKit.UIScrollView

public extension UIScrollView {
    
    static private func create(
        axis: NSLayoutConstraint.Axis = .vertical,
        showsScrollIndicator: Bool = true,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> UIScrollView {
        let scrollView = UIScrollView()
        let view = builder()
        view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(view)
        
        let height = view.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor)
        let width = view.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)

        switch axis {
        case .vertical:
            scrollView.showsVerticalScrollIndicator = showsScrollIndicator
            height.priority = .init(rawValue: 1)
        case .horizontal:
            scrollView.showsHorizontalScrollIndicator = showsScrollIndicator
            width.priority = .init(rawValue: 1)
        @unknown default:
            scrollView.showsVerticalScrollIndicator = showsScrollIndicator
            height.priority = .init(rawValue: 1)
        }
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            view.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor),
            scrollView.contentLayoutGuide.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            width,
            height
        ])
        
        return scrollView
    }
    
    static func vertical(
        showsScrollIndicator: Bool = true,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> UIScrollView {
        UIScrollView.create(axis: .vertical, showsScrollIndicator: showsScrollIndicator, builder)
    }
    
    static func horizontal(
        showsScrollIndicator: Bool = true,
        @SingleUIViewBuilder _ builder: () -> UIView
    ) -> UIScrollView {
        UIScrollView.create(axis: .horizontal, showsScrollIndicator: showsScrollIndicator, builder)
    }

}

public extension UIScrollView {
    @discardableResult
    func isScrollEnabled(_ isScrollEnabled: Bool) -> Self {
        self.isScrollEnabled = isScrollEnabled
        return self
    }
}
