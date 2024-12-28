import UIKit
import MapKit
import DeclarativeUIKit

extension Landmark {
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: self.coordinates.latitude,
            longitude: self.coordinates.longitude
        )
    }
}

final class LandmarkDetailViewController: UIViewController {
        
    private var landmark: Landmark!
    
    func inject(landmark: Landmark) {
        self.landmark = landmark
    }
    
    override func loadView() {
        super.loadView()

        self.view.backgroundColor = .white
        
        let NameView = { (landmark: Landmark) -> UIView in
            UIStackView.vertical {
                UIStackView.horizontal {
                    UILabel(landmark.name)
                        .font(UIFont.systemFont(ofSize: 30))
                        .textColor(.black)
                    
                    UIImageView(UIImage(systemName: landmark.isFavorite ? "star.fill" : "star")?.withRenderingMode(.alwaysTemplate))
                        .tintColor(.systemYellow)
                        .contentMode(.scaleAspectFit)
                    
                    UIView.spacer()
                    
                }.spacing(10)
                                
                UIStackView.horizontal {
                    
                    UILabel(landmark.park)
                        .font(UIFont.systemFont(ofSize: 18))
                        .textColor(.systemGray)
                    
                    UIView.spacer()
                    
                    UILabel(landmark.state)
                        .font(UIFont.systemFont(ofSize: 18))
                        .textColor(.systemGray)
                }
            }
        }
        
        let TextsView = { (landmark: Landmark) -> UIView in
            UIStackView.vertical {
                UILabel("Abount \(landmark.name)")
                    .font(UIFont.systemFont(ofSize: 20))
                    .textColor(.black)
                
                UILabel(landmark.description)
                    .font(UIFont.systemFont(ofSize: 16))
                    .textColor(.black)
                    .numberOfLines(0)
            }.spacing(10)
        }
        
        let imageOffset: CGFloat = 100
        let textHorizontalMargin: CGFloat = 12
        
        self.declarative { [self] in
            UIScrollView.vertical {
                UIStackView.vertical {
                    MapView().apply {
                        $0.setRegion(self.landmark.locationCoordinate)
                    }
                    .height(300)
                    .zStack {
                        CircleImageView().apply {
                            $0.setLandmark(self.landmark)
                        }
                        .centerX()
                        .bottom()
                        .offset(y: imageOffset)
                    }
                    .customSpacing(imageOffset)

                    UIStackView.vertical {

                        NameView(self.landmark)

                        UIView.divider()

                        TextsView(self.landmark)
                    }
                    .spacing(10)
                    .padding(insets: .init(horizontal: textHorizontalMargin))
                }
            }
        }
    }
}

import SwiftUI

#Preview {
    // TODO: 複数端末で表示させる
    let vc = LandmarkDetailViewController()
    vc.inject(landmark: ModelData.landmarks.first!)
    return vc
}
