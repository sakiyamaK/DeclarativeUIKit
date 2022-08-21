//
//  File.swift
//  
//
//  Created by sakiyamaK on 2022/08/21.
//

import UIKit
import DeclarativeUIKit


final class TiktokViewController: UIViewController {

    override func loadView() {
        super.loadView()
        setupLayout()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

@objc private extension TiktokViewController {
    func setupLayout() {
        
        self.view.backgroundColor = .white
        
        self.declarative(safeAreas: .init(all: false)) {
            UIImageView()
                .backgroundColor(.gray)
                .image(UIImage(named: "silversalmoncreek"))
                .contentMode(.scaleAspectFill)
                .clipsToBounds(true)
        }
        
        self.declarative(reset: false) {
            UIStackView.vertical {
                UILabel("08:27")
                    .textColor(.white)
                    .padding(insets: .init(horizontal: 8))
                    .backgroundColor(.red)
                    .height(30)
                    .cornerRadius(15)
                    .left()

                UIStackView.horizontal {
                    UIStackView.horizontal {
                        UILabel("Following")
                            .textColor(.white.withAlphaComponent(0.4))
                        UILabel("|")
                            .textColor(.white.withAlphaComponent(0.2))
                        UILabel("For You")
                            .font(UIFont.boldSystemFont(ofSize: 18))
                            .textColor(.white)
                    }
                    .spacing(8)
                    .centerX()
                    
                    UIImageView(UIImage(systemName: "questionmark.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal))
                }
                .alignment(.center)
                
                UIStackView.horizontal {
                    UIStackView.vertical {
                        UILabel("@hogehoge")
                            .textColor(.white)
                        UIStackView.horizontal {
                            UILabel("hogehogehogehogehogehogehoge")
                                .textColor(.white)
                                .contentCompressionResistancePriority(.defaultLow, for: .horizontal)
                            UILabel("#RN")
                                .textColor(.white)
                            UILabel("#Hatarakitakunai")
                                .textColor(.white)
                        }
                        .spacing(8)
                        .left()
                        UILabel("♫ - Hatarakitaku Naight -")
                            .textColor(.white)
                    }
                    .spacing(2)
                    .bottom()
                    
                    UIStackView.vertical {
                        UIView()
                            .zStack {
                                UIImageView(UIImage(named: "person_01"))
                                    .contentMode(.scaleAspectFit)
                                    .clipsToBounds(true)
                                    .backgroundColor(.cyan)
                                    .border(color: .white, width: 2)
                                    .size(width: 50, height: 50)
                                    .cornerRadius(25)
                            }
                            .zStack {
                                UIImageView(UIImage(systemName: "plus")?.withTintColor(.white, renderingMode: .alwaysOriginal))
                                    .contentMode(.scaleAspectFit)
                                    .padding(insets: .init(all: 2))
                                    .backgroundColor(.systemPink)
                                    .size(width: 22, height: 22)
                                    .cornerRadius(11)
                                    .centerX()
                                    .bottom()
                                    .offset(y: 10)
                            }
                            .customSpacing(16 + 10)
                        
                        UIStackView.vertical {
                            UIImageView(UIImage(systemName: "heart.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal))
                                .contentMode(.scaleAspectFit)
                                .size(width: 50, height: 50)
                            UILabel("17.7M")
                                .font(UIFont.systemFont(ofSize: 12))
                                .textColor(.white)
                        }
                        .alignment(.center)
                        
                        UIStackView.vertical {
                            UIImageView(UIImage(systemName: "ellipsis.bubble")?.withTintColor(.white, renderingMode: .alwaysOriginal))
                                .contentMode(.scaleAspectFit)
                                .size(width: 50, height: 50)
                            UILabel("17.7M")
                                .font(UIFont.systemFont(ofSize: 12))
                                .textColor(.white)
                        }
                        .alignment(.center)
                        
                        UIImageView(UIImage(systemName: "arrowshape.turn.up.forward.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal))
                            .size(width: 50, height: 50)
                            .contentMode(.scaleAspectFit)
                        
                        UIImageView(UIImage(systemName: "questionmark.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal))
                            .size(width: 50, height: 50)
                            .contentMode(.scaleAspectFit)
                    }
                    .spacing(16)
                    .bottom()
                }
                .spacing(50)
                UIView.spacer()
                    
            }
            .padding(insets: .init(top: 10, left: 16, bottom: 10, right: 16))
        }
    }
}
