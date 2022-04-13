//
//  File.swift
//  
//
//  Created by sakiyamaK on 2022/04/14.
//

import MapKit

public extension MKPointAnnotation {
    convenience init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.init()
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }

    convenience init(coordinate: CLLocationCoordinate2D, title: String) {
        self.init()
        self.coordinate = coordinate
        self.title = title
    }

    convenience init(coordinate: CLLocationCoordinate2D) {
        self.init()
        self.coordinate = coordinate
    }

    convenience init(title: String, subtitle: String) {
        self.init()
        self.title = title
        self.subtitle = subtitle
    }

    convenience init(title: String) {
        self.init()
        self.title = title
    }
}

//MARK: - Declarative method
public extension MKPointAnnotation {

    @discardableResult
    func coordinate(_ coordinate: CLLocationCoordinate2D) -> Self {
        self.coordinate = coordinate
        return self
    }

    @discardableResult
    func title(_ title: String) -> Self {
        self.title = title
        return self
    }
    
    @discardableResult
    func subtitle(_ subtitle: String) -> Self {
        self.subtitle = subtitle
        return self
    }
}
