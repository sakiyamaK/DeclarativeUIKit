//
//  MKMapView+.swift
//  
//
//  Created by sakiyamaK on 2022/04/14.
//

import MapKit

//MARK: - Declarative method
public extension MKMapView {
    
    @discardableResult
    func mapType(_ mapType: MKMapType) -> Self {
        self.mapType = mapType
        return self
    }

    @discardableResult
    func isZoomEnabled(_ isZoomEnabled: Bool) -> Self {
        self.isZoomEnabled = isZoomEnabled
        return self
    }

    @discardableResult
    func isScrollEnabled(_ isScrollEnabled: Bool) -> Self {
        self.isScrollEnabled = isScrollEnabled
        return self
    }

    @discardableResult
    func isPitchEnabled(_ isPitchEnabled: Bool) -> Self {
        self.isPitchEnabled = isPitchEnabled
        return self
    }

    @discardableResult
    func isRotateEnabled(_ isRotateEnabled: Bool) -> Self {
        self.isRotateEnabled = isRotateEnabled
        return self
    }

    @discardableResult
    func delegate(_ delegate: NSObject & MKMapViewDelegate) -> Self {
        self.delegate = delegate
        return self
    }

    @discardableResult
    func camera(_ camera: MKMapCamera, animated: Bool = false) -> Self {
        self.setCamera(camera, animated: animated)
        return self
    }
    
    @discardableResult
    func region(_ region: MKCoordinateRegion, animated: Bool = false) -> Self {
        self.setRegion(region, animated: animated)
        return self
    }

    @discardableResult
    func center(_ center: CLLocationCoordinate2D, animated: Bool = false) -> Self {
        self.setCenter(center, animated: animated)
        return self
    }

    @discardableResult
    func show(annotations: [MKAnnotation], animated: Bool = false) -> Self {
        self.showAnnotations(annotations, animated: animated)
        return self
    }

    @discardableResult
    func show(annotation: MKAnnotation, animated: Bool = false) -> Self {
        self.showAnnotations([annotation], animated: animated)
        return self
    }

    @discardableResult
    func add(annotations: [MKAnnotation]) -> Self {
        self.addAnnotations(annotations)
        return self
    }

    @discardableResult
    func add(annotation: MKAnnotation) -> Self {
        self.addAnnotation(annotation)
        return self
    }

    @discardableResult
    func remove(annotations: [MKAnnotation]) -> Self {
        self.removeAnnotations(annotations)
        return self
    }

    @discardableResult
    func remove(annotation: MKAnnotation) -> Self {
        self.removeAnnotation(annotation)
        return self
    }
    
    @discardableResult
    func select(annotation: MKAnnotation, animated: Bool = false) -> Self {
        self.selectAnnotation(annotation, animated: animated)
        return self
    }

    @discardableResult
    func visibleMapRect(_ mapRect: MKMapRect, animated: Bool = false) -> Self {
        self.setVisibleMapRect(mapRect, animated: animated)
        return self
    }

    @discardableResult
    func visibleMapRect(_ mapRect: MKMapRect, edgePadding: UIEdgeInsets, animated: Bool = false) -> Self {
        self.setVisibleMapRect(mapRect, edgePadding: edgePadding, animated: animated)
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func cameraBoundary(_ cameraBoundary: MKMapView.CameraBoundary?, animated: Bool = false) -> Self {
        self.setCameraBoundary(cameraBoundary, animated: animated)
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func cameraZoomRange(_ cameraZoomRange: MKMapView.CameraZoomRange?, animated: Bool = false) -> Self {
        self.setCameraZoomRange(cameraZoomRange, animated: animated)
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func pointOfInterestFilter(_ pointOfInterestFilter: MKPointOfInterestFilter?) -> Self {
        self.pointOfInterestFilter = pointOfInterestFilter
        return self
    }
    
    @discardableResult
    func showsBuildings(_ showsBuildings: Bool) -> Self {
        self.showsBuildings = showsBuildings
        return self
    }
    
    @discardableResult
    func showsCompass(_ showsCompass: Bool) -> Self {
        self.showsCompass = showsCompass
        return self
    }

    @discardableResult
    func showsScale(_ showsScale: Bool) -> Self {
        self.showsScale = showsScale
        return self
    }

    @discardableResult
    func showsTraffic(_ showsTraffic: Bool) -> Self {
        self.showsTraffic = showsTraffic
        return self
    }
    
    @discardableResult
    func showsUserLocation(_ showsUserLocation: Bool) -> Self {
        self.showsUserLocation = showsUserLocation
        return self
    }
    
    @discardableResult
    func userTrackingMode(_ userTrackingMode: MKUserTrackingMode, animated: Bool = false) -> Self {
        self.setUserTrackingMode(userTrackingMode, animated: animated)
        return self
    }
}

