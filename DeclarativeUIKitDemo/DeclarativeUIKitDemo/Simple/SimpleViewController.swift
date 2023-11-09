//
//  SimpleViewController.swift
//  DeclarativeUIKitDemo
//
//  Created by sakiyamaK on 2021/12/27.
//

import UIKit
import DeclarativeUIKit

final class SimpleViewController: UIViewController {

    var label = UILabel()
    
    override func loadView() {
        super.loadView()

        self.view.backgroundColor = .white
        
        let Header = { (title: String) -> UIView in
            UIStackView.vertical {
                UIView.spacer()
                UILabel(title)
                    .textColor(.white)
                    .textAlignment(.center)
                    .numberOfLines(0)
                    .font(UIFont.systemFont(ofSize: 30))
                UIView.spacer()
            }
            .spacing(10)
            .backgroundColor(.gray)
        }
        
        let ScrollBlocksView = {
            UIScrollView.horizontal {
                UIStackView.horizontal{ stackView in
                    UIView()
                        .apply { _ in
                            print(stackView)
                        }
                        .width(100)
                        .height(100)
                        .backgroundColor(.red)
                    UIView()
                        .width(100)
                        .aspectRatio(1.0)
                        .backgroundColor(.green)
                        .cornerRadius(30, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMaxYCorner])
                    UIView()
                        .size(width: 100, height: 100)
                        .border(color: .blue, width: 10)
                    UIView()
                        .size(width: 100, height: 100)
                        .backgroundColor(.black)
                        .transform(.init(rotationAngle: 45.0/360 * Double.pi))
                    UIView().apply {
                        $0.heightConstraint = 100
                        $0.widthConstraint = 100
                        $0.backgroundColor = .systemRed
                    }
                    .shadow(color: .black.withAlphaComponent(0.8), radius: 10, x: 5, y: 5)
                    
                    UIView()
                        .backgroundColor(.systemRed)
                        .padding()
                        .backgroundColor(.systemYellow)
                        .size(width: 100, height: 100)
                    
                }.spacing(20)
                    .padding(insets: .init(top: 20, left: 10, bottom: 20, right: 10))
            }
            .showsScrollIndicator(false)
        }
        
        let ZStackView = {
            UIStackView.horizontal {
                UIView()
                    .height(200)
                    .backgroundColor(.brown)
                    .zStack {
                        UILabel("上に重なってるね")
                            .font(UIFont.boldSystemFont(ofSize: 20))
                            .textColor(.white)
                            .textAlignment(.center)
                    }
            }
            .alignment(.center)
        }
        
        let Geometry = {
            UIView()
                .backgroundColor(.red)
                .zStack {
                    UIStackView.horizontal { superview in
                        UIView()
                            .backgroundColor(.blue)
                            .heightEqual(to: superview, constraint: superview.heightAnchor - 20)
                        
                        UIView()
                            .backgroundColor(.green)
                            .widthEqual(to: superview, constraint: superview.widthAnchor * 0.4)
                            .heightEqual(to: superview, constraint: superview.heightAnchor / 2 + 10)
                    }
                    .height(100)
                    .alignment(.center)
                }
        }
        
        let SomeViews = {
            UIStackView {
                Array(1...10).compactMap { num -> UILabel in
                    if num < 6 {
                        return UILabel("\(num)番目のlabel")
                            .textColor(.black)
                            .textAlignment(.center)
                    } else {
                        return UILabel().apply {
                            let label = $0 as! UILabel
                            let attributes: [NSAttributedString.Key: Any] = [
                                .foregroundColor: UIColor.orange,
                                .strokeColor: UIColor.red
                            ]
                            label.attributedText = NSAttributedString(string: "\(num)番目のlabel", attributes: attributes)
                        }.textAlignment(.center)
                    }
                }
            }.spacing(10)
        }

        let UISwitchViews = {
            UIStackView.horizontal(distribution: .equalCentering) {
                UISwitch()
                    .isOn(true)
                    .onTintColor(.red)
                    .add(target: self, action: #selector(self.uiSwitchValueChanged(sender:)), for: .valueChanged)
                    .customSpacing(50)
                UILabel()
                    .text("ON")
                    .assign(to: &self.label)
            }.padding(insets: .init(all: 20))
        }
        
        self.declarative {
            UIScrollView.vertical {
                UIStackView.vertical {
                    Header("UIViewの設定")
                    ScrollBlocksView()
                    Header("Z方向の設定")
                    ZStackView()
                    Header("親ビューの大きさで設定")
                    Geometry()
                    Header("配列で用意")
                    SomeViews()
                    Header("UISwitch")
                    UISwitchViews()
                }
            }
        }
    }

    @objc private func uiSwitchValueChanged(sender: UISwitch) {
        label.text = sender.isOn ? "ON" : "OFF"
    }
}
