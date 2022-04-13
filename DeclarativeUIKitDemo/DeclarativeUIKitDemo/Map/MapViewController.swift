//
//  MapViewController.swift
//  
//
//  Created by sakiyamaK on 2022/04/14.
//

import UIKit
import MapKit
import DeclarativeUIKit

final class MapViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = .white
        
        self.declarative(safeAreas: .init(all: false)) {
            MKMapView()
                .region(
                    MKCoordinateRegion(
                        center: .init(latitude: 35.6598, longitude: 139.7023),
                        latitudinalMeters: 1000,
                        longitudinalMeters: 1000
                    )
                )
                .mapType(.hybridFlyover)
                .isZoomEnabled(true)
                .isRotateEnabled(false)
                .delegate(self)
        }
    }
}
    
extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
    }
}

