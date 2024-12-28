import UIKit
import DeclarativeUIKit

final class LandmarkRow: UICollectionViewCell {

    private weak var iconView: UIImageView!
    private weak var textLabel: UILabel!
    private weak var starView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
                
        self.contentView.declarative(priorities: .init(bottom: .defaultLow)) {
            UIStackView {
                UIView.spacer()
                
                UIStackView.horizontal {
                    UIImageView(assign: &self.iconView)
                        .size(width: 50, height: 50)

                    UILabel(assign: &self.textLabel)

                    UIView.spacer()

                    UIImageView(assign: &self.starView)
                        .image(UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate))
                        .apply({
                            $0.tintColor = .systemYellow
                        }).isHidden(true)
                }
                .spacing(8)
                .alignment(.center)
                
                UIView.divider()
            }
            .spacing(10)
        }
    }
            
    func configure(landmark: Landmark) {
        iconView.image = UIImage(named: landmark.imageName)
        textLabel.text = landmark.name
        starView.isHidden = !landmark.isFavorite
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import SwiftUI

#Preview(traits: .fixedLayout(width: 300, height: 70)) {
    let cell = LandmarkRow()
    cell.configure(landmark: ModelData.landmarks[0])
    return cell
}

#Preview(traits: .fixedLayout(width: 300, height: 70)) {
    let cell = LandmarkRow()
    cell.configure(landmark: ModelData.landmarks[1])
    return cell
}
