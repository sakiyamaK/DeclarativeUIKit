//
//  HotReloadViewController.swift
//  DeclarativeUIKitDemo
//
//  Created by sakiyamaK on 2022/03/06.
//

import UIKit
import MapKit
import DeclarativeUIKit

extension Notification.Name {
    static let injection = Notification.Name("INJECTION_BUNDLE_NOTIFICATION")
}

extension NotificationCenter {
    func addInjectionObserver(_ observer: Any, selector: Selector, object: Any?) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: .injection, object: object)
    }
}

final class HotReloadViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        NotificationCenter.default.addInjectionObserver(self, selector: #selector(setupLayout), object: nil)
        setupLayout()
    }
}

@objc private extension HotReloadViewController {
    func setupLayout() {
        self.view.backgroundColor = .white
        self.declarative {
            MKMapView()
                .region(.init(center: .init(latitude: 35.6598, longitude: 139.7023), latitudinalMeters: 1000, longitudinalMeters: 1000))
                .mapType(.hybridFlyover)
                .isZoomEnabled(true)
                .isRotateEnabled(false)
                .add(annotation: MKPointAnnotation()
                    .coordinate(.init(latitude: 35.6598, longitude: 139.7023))
                    .title("どこやねん")
                    .subtitle("わからんわ")
                )
                .delegate(self)
        }
    }
}

extension HotReloadViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
    }
}
