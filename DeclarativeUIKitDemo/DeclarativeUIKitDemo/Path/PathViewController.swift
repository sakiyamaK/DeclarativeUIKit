import UIKit

final class PathViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.declarative {
            UIStackView { superview in
                UIView.path {
                    
                    let size = superview.frame.size

                    //宣言的に書けるよ
                    UIBezierPath().apply {
                        $0.move(to: CGPoint(x: 0, y: size.height))
                        $0.addLine(to: CGPoint(x: size.width, y: 0))
                    }.stroke(.green, lineWidth: 10)

                    //いくらでも増やせるよ
                    UIBezierPath().apply {
                        $0.move(to: CGPoint(x: 0, y: 0))
                        $0.addLine(to: CGPoint(x: size.width, y: size.height))
                    }.stroke(.red, lineWidth: 10)

                    //既存の書き方でもいいよ
                    let path = UIBezierPath()
                    path.move(to: CGPoint(x: size.width/2, y: 0))
                    path.addLine(to: CGPoint(x: size.width/2, y: size.height))
                    UIColor.blue.setStroke()
                    path.lineWidth = 10
                    path.stroke()
                    
                }
            }.distribution(.fillEqually)
        }
    }
}
