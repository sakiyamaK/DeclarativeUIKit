import UIKit
import DeclarativeUIKit

final class CustomCollectionViewCell: UICollectionViewCell {
    
    private enum ViewTag: Int {
        case titleLabel = 1
        case subTitleLabel = 2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.declarate {
            UIStackView.vertical {
                UILabel {
                    guard let label = $0 as? UILabel else { return }
                    label.textAlignment = .center
                    label.font = UIFont.systemFont(ofSize: 20)
                }.tag(ViewTag.titleLabel.rawValue)
                
                UILabel {
                    guard let label = $0 as? UILabel else { return }
                    label.textAlignment = .left
                    label.font = UIFont.systemFont(ofSize: 10)
                }.tag(ViewTag.subTitleLabel.rawValue)
                
                UIView.spacer().height(20).backgroundColor(.gray)

            }
        }
    }
    
    func configure(indexPath: IndexPath) {
        guard
            let titleLabel = self.contentView.viewWithTag(ViewTag.titleLabel.rawValue) as? UILabel,
        let subTitleLabel = self.contentView.viewWithTag(ViewTag.subTitleLabel.rawValue) as? UILabel
        else { return }
        
        titleLabel.text = indexPath.section.description
        subTitleLabel.text = indexPath.row.description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class CustomCellCollectionViewController: UIViewController {
    
    enum ViewTag: Int {
        case button = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
                
        self.declarate {
            UIStackView.vertical {
                UILabel {
                    guard let label = $0 as? UILabel else { return }
                    label.text = "カスタムセルのコレクションビューのサンプル"
                    label.textAlignment = .center
                    label.font = UIFont.boldSystemFont(ofSize: 20)
                }
                
                UIView.spacer().height(10)
                UIView.spacer().height(0.5).backgroundColor(.gray)
                UIView.spacer().height(10)

                UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
                    .imperative {
                    guard let collectionView = $0 as? UICollectionView else { return }
                        collectionView.delegate = self
                        collectionView.dataSource = self
                    collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
                }
            }
        }
    }
}

extension CustomCellCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.maxX/10, height: 100)
    }
}

extension CustomCellCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        cell.configure(indexPath: indexPath)
        return cell
    }
}

import SwiftUI

struct CustomCellCollectionViewController_Wrapper: UIViewControllerRepresentable {
    typealias ViewController = CustomCellCollectionViewController
    // 初期化メソッド
    func makeUIViewController(context: Context) -> ViewController {
        let vc = ViewController()
        return vc
    }

    // 更新用のメソッド
    func updateUIViewController(_ vc: ViewController, context: Context) {
    }
}

struct CustomCellCollectionViewController_Previews: PreviewProvider {
  static var previews: some View {
      Group {
          CustomCellCollectionViewController_Wrapper()
      }
  }
}
