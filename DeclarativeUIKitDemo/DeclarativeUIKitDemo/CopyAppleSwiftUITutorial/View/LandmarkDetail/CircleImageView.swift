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

import SwiftUI

private struct View_Wrapper: UIViewRepresentable {
    typealias View = UIView

    var landmark: Landmark

    func makeUIView(context: Context) -> View {
        UIStackView {
            UIView.spacer()

            //なぜかsegmentation fault: 11になる
//            CircleImageView.imperative {
//                let circleImageView = $0 as! CircleImageView
//                circleImageView.setLandmark(landmark)
//            }

            UIView.spacer()
        }
        .distribution(.equalSpacing)
        .alignment(.center)
    }

    func updateUIView(_ cell: View, context: Context) {
    }
}

struct CircleImageVIew_Previews: PreviewProvider {

    static var landmarks = ModelData.landmarks

    static var previews: some View {
        Group {
            View_Wrapper(landmark: landmarks.first!)
        }
        .previewLayout(.fixed(width: 400, height: 400))
    }
}
