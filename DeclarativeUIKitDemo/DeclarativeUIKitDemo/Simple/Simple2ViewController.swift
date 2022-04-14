//
//  File.swift
//  
//
//  Created by sakiyamaK on 2022/02/13.
//

import UIKit
import DeclarativeUIKit

final class Simple2ViewController: UIViewController {
    
    private weak var button: UIButton!
    private weak var tapLabel: UILabel!
    private weak var overlapView: UIView!
    private weak var indicator: UIActivityIndicatorView!
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = .white
                                
        let Header = { (title: String) -> UIView in
            UIStackView.vertical {
                UILabel(title)
                    .textColor(.black)
                    .textAlignment(.center)
                    .numberOfLines(0)
                    .font(UIFont.systemFont(ofSize: 30))
                UIView.spacer().height(10)
                UIView.divider()
            }
        }
        
        self.declarative {
            UIStackView.vertical {
                UIProgressView(progressViewStyle: .bar)
                    .progress(1.0, animated: true)
                    .progressTintColor(.systemRed)
                Header("その他のViewの設定")
                UIScrollView.vertical {
                    UIStackView.vertical {
                        UIImageView(UIImage.init(systemName: "square.and.arrow.up"))
                            .contentMode(.scaleAspectFit)
                            .height(200)

                        if #available(iOS 14.0, *) {
                            UIButton("button")
                                .titleColor(.brown)
                                .addAction(.touchUpInside) { [weak self] action in
                                    guard let self = self,
                                          let sender = action.sender as? UIButton else { return }
                                    self.tapButton(sender)
                                }
                                .assign(to: &self.button)
                        } else {
                            UIButton("button")
                                .titleColor(.brown)
                                .addControlAction(target: self, for: .touchUpInside) {
                                    #selector(self.tapButton)
                                }
                                .assign(to: &self.button)
                        }
                        
                        UITextField()
                            .placeholder(NSAttributedString(string: "プレースホルダー", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]))
                            .borderStyle(.line)
                            .keyboardType(.alphabet)
                            .delegate(self)
                        
                        UILabel(assign: &self.tapLabel)
                            .text("タップジェスチャーのあるラベル")
                            .textAlignment(.center)
                            .isUserInteractionEnabled(true)
                            .numberOfLines(1)
                            .addGestureRecognizer {
                                UITapGestureRecognizer(target: self) {
                                    #selector(self.tapLabel(_:))
                                }
                            }
                    }
                    .spacing(40)
                    .padding(insets: .init(horizontal: 10))
                    .zStack {
                        UIActivityIndicatorView(assign: &indicator)
                            .imperative({
                                let indicator = $0 as! UIActivityIndicatorView
                                indicator.startAnimating()
                            })
                            .style(.large)
                            .color(.blue)
                            .isHidden(true)
                            .hidesWhenStopped(true)
                            .center()
                    }

                }
                .refreshControl {
                    UIRefreshControl()
                        .addControlAction(target: self, for: .valueChanged) {
                            #selector(refresh)
                        }
                }
            }
            .spacing(20)
        }
                
        //セーフエリアを無視したレイアウトをさらに上に追加
        self.declarative(safeAreas: .init(all: false), reset: false) {
            UIView.spacer()
                .backgroundColor(.black.withAlphaComponent(0.3))
                .assign(to: &overlapView)
                .isHidden(true)
                
        }
    }
}

@objc extension Simple2ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("テキストフィールドのデリゲートだね")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

@objc private extension Simple2ViewController {
    func tapLabel(_ sender: UIGestureRecognizer) {
        if tapLabel == sender.view {
            print(self.tapLabel.text ?? "")
        }
        UIAlertController(title: "ラベルをタップ", message: "アラートです", preferredStyle: .actionSheet) {
            UIAlertAction(title: "default", style: .default) { _ in
                UIAlertController(title: "defaultをタップ", message: nil, preferredStyle: .alert, {
                    UIAlertAction(title: "閉じる", style: .cancel)
                }).present(from: self, animated: true, completion: nil)
            }
            UIAlertAction(title: "cancel", style: .cancel) { _ in
                UIAlertController(title: "cancelをタップ", message: nil, preferredStyle: .alert, {
                    UIAlertAction(title: "閉じる", style: .cancel)
                }).present(from: self, animated: true, completion: nil)
            }
            UIAlertAction(title: "destructive", style: .destructive) { _ in
                UIAlertController(title: "destructiveをタップ", message: nil, preferredStyle: .alert, {
                    UIAlertAction(title: "閉じる", style: .cancel)
                }).present(from: self, animated: true, completion: nil)
            }
        }.present(from: self, animated: true, completion: nil)
    }
    
    func tapButton(_ sender: UIButton) {
        print("ボタンをタップしたね")
        if button == sender {
            print(self.button.titleLabel?.text ?? "")
        }
        
        self.overlapView.isHidden.toggle()
        self.indicator.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.overlapView.isHidden.toggle()
            self.indicator.isHidden = true
        }
    }
    
    func refresh(_ sender: UIRefreshControl) {
        print("リフレッシュするよ")
        if sender.isRefreshing {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                sender.endRefreshing()
            }
        }
    }
}
