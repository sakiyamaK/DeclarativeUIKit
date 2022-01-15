import UIKit
import DeclarativeUIKit
import MapKit

final class MapView: UIView {
        
    private weak var mapView: MKMapView!

    private static let defCoordinate = CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868)
    private static let defSpan = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)

    private var region = MKCoordinateRegion()
    var coordinate: CLLocationCoordinate2D = MapView.defCoordinate

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.declarative {
            MKMapView(assign: &mapView)
        }
    }
    
    func setRegion(_ coordinate: CLLocationCoordinate2D) {
        self.region = MKCoordinateRegion(
          center: coordinate,
          span: MapView.defSpan
        )
        mapView.setRegion(region, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
