import UIKit
import DeclarativeUIKit
import MapKit

extension Landmark {
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: self.coordinates.latitude,
            longitude: self.coordinates.longitude
        )
    }
}

final class LandmarkDetailViewController: UIViewController {
    private enum ViewTag: Int {
        case mapView = 1
    }
    var landmark: Landmark!
    
    func inject(landmark: Landmark) {
        self.landmark = landmark
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let NameView = { (landmark: Landmark) -> UIView in
            UIStackView.vertical {
                UIStackView.horizontal {
                    UILabel {
                        let label = $0 as! UILabel
                        label.text = landmark.name
                        label.font = UIFont.systemFont(ofSize: 30)
                        label.textColor = .black
                    }
                    
                    UIImageView {
                        let imageView = $0 as! UIImageView
                        imageView.image = UIImage(systemName: landmark.isFavorite ? "star.fill" : "star")?.withRenderingMode(.alwaysTemplate)
                        imageView.tintColor = .systemYellow
                        
                    }.contentMode(.scaleAspectFit)
                    
                    UIView.spacer()
                    
                }.spacing(10)
                
                UIStackView.horizontal {
                    
                    UILabel {
                        let label = $0 as! UILabel
                        label.text = landmark.park
                        label.font = UIFont.systemFont(ofSize: 18)
                        label.textColor = .systemGray
                    }
                    
                    UIView.spacer()
                    
                    UILabel {
                        let label = $0 as! UILabel
                        label.text = landmark.state
                        label.font = UIFont.systemFont(ofSize: 18)
                        label.textColor = .systemGray
                    }
                }
            }
        }
        
        let TextsView = { (landmark: Landmark) -> UIView in
            UIStackView.vertical {
                UILabel {
                    let label = $0 as! UILabel
                    label.text = "Abount \(landmark.name)"
                    label.font = UIFont.systemFont(ofSize: 20)
                    label.textColor = .black
                }
                
                UILabel {
                    let label = $0 as! UILabel
                    label.text = landmark.description
                    label.font = UIFont.systemFont(ofSize: 16)
                    label.textColor = .black
                    label.numberOfLines = 0
                }
            }
        }
        
        let imageOffset: CGFloat = 100
        let textHorizontalMargin: CGFloat = 12
        
        self.declarate(safeAreas: .init(top: false)) {
            UIScrollView.vertical {
                UIStackView.vertical {
                    MapView()
                        .imperative {
                            let mapView = $0 as! MapView
                            mapView.setRegion(landmark.locationCoordinate)
                        }
                        .height(300)
                        .tag(ViewTag.mapView.rawValue)
                        .zStack(margin: .init(top: 0, left: 0, bottom: -imageOffset, right: 0)) {
                            UIStackView.vertical {
                                UIView.spacer()
                                CircleImageView {
                                    let circleImageView = $0 as! CircleImageView
                                    circleImageView.setLandmark(landmark)
                                }
                            }
                            .alignment(.center)
                        }
                    
                    UIView.spacer().height(imageOffset)
                    
                    UIView()
                        .zStack(margin: .init(top: 0, left: textHorizontalMargin, bottom: 0, right: textHorizontalMargin)) {
                        
                        UIStackView.vertical {
                            NameView(landmark)
                            
                            UIView.spacer().height(10)
                            UIView.spacer().height(0.5).backgroundColor(.lightGray)
                            UIView.spacer().height(10)
                            
                            TextsView(landmark)
                        }
                    }
                }
            }
        }
    }
}


import SwiftUI

private struct ViewController_Wrapper: UIViewControllerRepresentable {
    typealias ViewController = LandmarkDetailViewController
    
    var landmark: Landmark
    
    func makeUIViewController(context: Context) -> ViewController {
        let vc = ViewController()
        vc.inject(landmark: landmark)
        return vc
    }
    
    func updateUIViewController(_ vc: ViewController, context: Context) {
    }
}

struct LandmarkDetailViewController_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewController_Wrapper(landmark: ModelData.landmarks.first!)
        }
    }
}
