//
//  ViewController.swift
//  DeclarativeUIKitDemo
//
//  Created by sakiyamaK on 2021/12/25.
//

import UIKit
import DeclarativeUIKit

final class DeclarativeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.build {
            UIStackView.vStack {
                UIStackView.hStack(distribution: .equalCentering ) {
                    UIView.spacer()
                    UILabel.build {
                        guard let label = $0 as? UILabel else { return }
                        label.text = "Declative UIKit"
                        label.textColor = .black
                        label.textAlignment = .center
                        label.font = UIFont.systemFont(ofSize: 30)             
                    }
                    UIView.spacer()
                }
                UIView.spacer(height: 10)
                UIView.spacer(height: 0.5, backgroundColor: .gray)
                UIView.spacer(height: 30)
                UIStackView.hStack(distribution: .equalSpacing) {
                    UIView.spacer(width: 0)
                    UIView.build {
                        $0.heightConstraint = 100
                        $0.widthConstraint = 100
                        $0.backgroundColor = .red
                    }
                    UIView.build {
                        $0.heightConstraint = 100
                        $0.widthConstraint = 100
                        $0.backgroundColor = .green
                    }
                    UIView.build {
                        $0.heightConstraint = 100
                        $0.widthConstraint = 100
                        $0.backgroundColor = .blue
                    }
                    UIView.spacer(width: 0)
                }
                UIStackView.hStack(distribution: .fillEqually) {
                    UIView.spacer()
                    UIImageView.build {
                        guard let imageView = $0 as? UIImageView else { return }
                        imageView.heightConstraint = 200
                        imageView.heightConstraint = 200
                        imageView.contentMode = .scaleAspectFit
                        imageView.image = UIImage.init(systemName: "square.and.arrow.up")
                    }
                    UIView.spacer()
                }
                UIStackView.hStack(distribution: .equalSpacing) {
                    UIView.spacer(width: 0)
                    UIButton.build {
                        guard let button = $0 as? UIButton else { return }
                        button.setTitle("button", for: .normal)
                        button.setTitleColor(.brown, for: .normal)
                        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
                    }
                    UIView.spacer(width: 0)
                }
            }
        }
    }
}

@objc private extension DeclarativeViewController {
    func tapButton(_ sender: UIButton) {
        print("ボタンをタップしたね")
    }
}


