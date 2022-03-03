import UIKit
import DeclarativeUIKit

final class CollectionViewController: UIViewController {
    
    enum ViewTag: Int {
        case button = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.declarative {
            UIStackView.vertical {
                UILabel.imperative {
                    let label = $0 as! UILabel
                    label.text = "コレクションビューのサンプル"
                    label.textAlignment = .center
                    label.font = UIFont.boldSystemFont(ofSize: 20)
                }
                
                UIView.divider()
                
                UICollectionView {
                    UICollectionViewFlowLayout()
                }
                .dataSource(self)
                .delegate(self)
                .registerCellClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
            }
            .spacing(10)
        }
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.contentView.backgroundColor = indexPath.item%2 == 0 ? UIColor.systemRed : UIColor.systemBlue
        return cell
    }
}

import SwiftUI

struct CollectionViewController_Wrapper: UIViewControllerRepresentable {
    typealias ViewController = CollectionViewController
    // 初期化メソッド
    func makeUIViewController(context: Context) -> ViewController {
        let vc = ViewController()
        return vc
    }
    
    // 更新用のメソッド
    func updateUIViewController(_ vc: ViewController, context: Context) {
    }
}

struct CollectionViewController_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CollectionViewController_Wrapper()
        }
    }
}
