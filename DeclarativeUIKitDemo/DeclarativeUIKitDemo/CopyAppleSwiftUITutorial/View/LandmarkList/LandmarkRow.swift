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
                    UIImageView(assign: &iconView)
                        .size(width: 50, height: 50)

                    UILabel(assign: &textLabel)

                    UIView.spacer()

                    UIImageView(assign: &starView)
                        .image(UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate))
                        .imperative({
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
