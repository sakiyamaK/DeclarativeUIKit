import UIKit
import DeclarativeUIKit

final class CircleImageView: UIView {
    
    private weak var imageView: UIImageView!
    
    private let width: CGFloat = 200
    private let margin: CGFloat = 5

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.declarative {
            UIImageView(assign: &imageView)
                .cornerRadius((width - 2*margin)/2)
                .clipsToBounds(true)
                .contentMode(.scaleAspectFill)
                .padding(margin)
                .backgroundColor(.white)
                .shadow(color: .black, radius: 4)
                .cornerRadius(width/2)
                .size(width: width, height: width)
        }
    }
    
    func setLandmark(_ landmark: Landmark) {
        imageView.image = UIImage(named: landmark.imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
