import UIKit

final class PathViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(update),
                                               name: Notification.Name("INJECTION_BUNDLE_NOTIFICATION"), object: nil)
        update()
    }
    
    @objc
    private func update() {
        self.declarative {
            UIStackView { superview in
                UIView.path {
                    
                    let size = superview.frame.size

                    //宣言的に書けるよ
                    UIBezierPath().imperative {
                        $0.move(to: CGPoint(x: 0, y: size.height))
                        $0.addLine(to: CGPoint(x: size.width, y: 0))
                    }.stroke(.green, lineWidth: 10)

                    //いくらでも増やせるよ
                    UIBezierPath.imperative {
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
