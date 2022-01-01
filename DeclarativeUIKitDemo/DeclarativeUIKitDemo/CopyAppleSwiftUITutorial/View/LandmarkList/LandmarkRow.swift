import UIKit
import DeclarativeUIKit

final class LandmarkRow: UICollectionViewCell {

    private enum ViewTag: Int {
        case icon = 1
        case text
        case star
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
                
        self.contentView.declarate(priorities: .init(bottom: .defaultLow)) {
            UIStackView.vertical {
                UIView.spacer()
                
                UIStackView.horizontal {
                    UIImageView(tag: ViewTag.icon.rawValue)
                    .size(width: 50, height: 50)
                    
                    UILabel(tag: ViewTag.text.rawValue)
                    
                    UIView.spacer()
                    
                    UIImageView(tag: ViewTag.star.rawValue) {
                        let imageView = $0 as! UIImageView
                        imageView.image = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
                        imageView.tintColor = .systemYellow
                    }
                    .isHidden(true)
                }
                .spacing(8)
                .alignment(.center)
                
                UIView.spacer().height(0.5).backgroundColor(.lightGray)
            }
            .spacing(10)
        }
    }
            
    func configure(landmark: Landmark) {
        let iconView = self.getView(tag: ViewTag.icon.rawValue) as! UIImageView
        let textLabel = self.getView(tag: ViewTag.text.rawValue) as! UILabel
        let starView = self.getView(tag: ViewTag.star.rawValue) as! UIImageView
        
        iconView.image = UIImage(named: landmark.imageName)
        textLabel.text = landmark.name
        starView.isHidden = !landmark.isFavorite
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import SwiftUI

private struct View_Wrapper: UIViewRepresentable {
    typealias View = LandmarkRow
    
    var landmark: Landmark
    
    func makeUIView(context: Context) -> View {
        return View.init(frame: .zero)
    }
    
    func updateUIView(_ cell: View, context: Context) {
        cell.configure(landmark: landmark)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    
    static var landmarks = ModelData.landmarks
    
    static var previews: some View {
        Group {
            ForEach(0..<2) { idx in
                View_Wrapper(landmark: landmarks[idx])
            }
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
