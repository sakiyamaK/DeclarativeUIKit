//
//  TwitterHomeViewController.swift
//  DeclarativeUIKitDemo
//
//  Created by sakiyamaK on 2022/08/21.
//

import UIKit
import DeclarativeUIKit

final class TwitterHomeCell: UICollectionViewCell {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.declarative {
            UIStackView.vertical {
                UIStackView.vertical {
                    UIStackView.horizontal {
                        UIImageView(UIImage(systemName: "arrow.2.squarepath")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal))
                            .contentMode(.scaleAspectFit)
                            .width(20)
                            .height(20)
                            .padding(insets: .init(top: 0, left: 30, bottom: 0, right: 0))
                            .customSpacing(8)

                        UILabel("hogehogeさんがリツイート")
                    }
                    .customSpacing(8)
                    
                    UIStackView.horizontal {
                        UIImageView(UIImage(named: "person_01"))
                            .contentMode(.scaleAspectFill)
                            .clipsToBounds(true)
                            .size(width: 50, height: 50)
                            .cornerRadius(25)
                            .customSpacing(8)
                        
                        UIStackView.vertical {
                            UIStackView.horizontal {
                                UILabel("長い名前だよおおおおおおおおおおお")
                                    .numberOfLines(1)
                                    .font(UIFont.boldSystemFont(ofSize: 12))
                                    .textColor(.black)
                                    .contentHuggingPriority(.required, for: .vertical)
                                    .customSpacing(8)

                                UILabel("@hoehoge")
                                    .numberOfLines(1)
                                    .font(UIFont.systemFont(ofSize: 12))
                                    .textColor(.systemGray)
                                    .contentHuggingPriority(.required, for: .vertical)
                                    .contentCompressionResistancePriority(.defaultLow, for: .horizontal)
                                    .customSpacing(8)

                                UILabel("@4時間")
                                    .numberOfLines(1)
                                    .font(UIFont.systemFont(ofSize: 12))
                                    .textColor(.systemGray)
                                    .contentHuggingPriority(.required, for: .vertical)
                                    .customSpacing(8)

                                UIView.spacer()
                                
                                UILabel("...")
                                    .numberOfLines(1)
                                    .font(UIFont.systemFont(ofSize: 12))
                                    .textColor(.systemGray)
                                    .contentHuggingPriority(.required, for: .vertical)
                            }
                            .alignment(.top)
                            .customSpacing(8)

                            UILabel("""
    ここがメインのツイートだよおおおおおおおおおおおおおおおおお
    ここがメインのツイートだよおおおおおおおおお
    ここがメインのツイートだよおおおおおおおお
    ここがメインのツイートだよおおおおおおお
    ここがメインのツイートだよおおおお
    ここがメインのツイートだよおおおおおおおおおおお
    """)
                                .numberOfLines(0)
                                .font(UIFont.systemFont(ofSize: 12))
                                .textColor(.black)
                                .customSpacing(8)

                            UIImageView(UIImage(named: "person_01"))
                                .aspectRatio(1.2)
                                .contentMode(.scaleAspectFill)
                                .clipsToBounds(true)
                                .border(color: .systemGray, width: 1)
                                .cornerRadius(10)
                        }
                    }
                    .alignment(.top)
                }
                .padding(insets: .init(all: 16))
                
                UIView.divider()
            }
        }
    }
}

final class TwitterHomeViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.view.backgroundColor = .white
        
        self.declarative {
            UICollectionView {
                UICollectionViewCompositionalLayout { _, _ -> NSCollectionLayoutSection? in
                    
                    let itemSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .estimated(100)
                    )
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    item.contentInsets = .zero
                    
                    let groupSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .estimated(100)
                    )
                    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                    
                    let section = NSCollectionLayoutSection(group: group)
                    
                    return section
                }
            }
            .dataSource(self)
            .registerCellClass(TwitterHomeCell.self, forCellWithReuseIdentifier: "TwitterHomeCell")
        }
        
        self.declarative(reset: false) {
            UIButton(UIImage(systemName: "plus")?.withTintColor(.white, renderingMode: .alwaysOriginal))
                .backgroundColor(.systemBlue)
                .size(width: 50, height: 50)
                .cornerRadius(25)
                .bottom()
                .right()
                .offset(x: -10, y: -10)
        }
    }
}

extension TwitterHomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwitterHomeCell", for: indexPath) as! TwitterHomeCell
        return cell
    }
}

import SwiftUI

struct TwitterHomeViewController_Wrapper: UIViewControllerRepresentable {
    typealias ViewController = TwitterHomeViewController
    func makeUIViewController(context: Context) -> ViewController {
        let vc = ViewController()
        return vc
    }
    
    func updateUIViewController(_ vc: ViewController, context: Context) {
    }
}

struct TiwtterHomeViewController_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TwitterHomeViewController_Wrapper()
        }
    }
}
