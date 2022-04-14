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
                .add(annotations:
                        [
                            MKPointAnnotation(coordinate: .init(latitude: 35.6598, longitude: 139.7023), title: "渋谷付近1", subtitle: "詳しくは分からない"),
                            MKPointAnnotation(coordinate: .init(latitude: 35.6578, longitude: 139.7023), title: "渋谷付近2", subtitle: "詳しくは分からない"),
                            MKPointAnnotation(coordinate: .init(latitude: 35.6608, longitude: 139.7023), title: "渋谷付近3", subtitle: "詳しくは分からない")
                            ]
                )
                .delegate(self)
        }
    }
}
    
extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
    }
}

