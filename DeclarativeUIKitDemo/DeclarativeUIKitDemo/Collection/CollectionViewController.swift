import UIKit
import DeclarativeUIKit

final class CollectionViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .white
        
        self.declarative {
            UIStackView.vertical {
                UILabel().apply {
                    $0.text = "コレクションビューのサンプル"
                    $0.textAlignment = .center
                    $0.font = UIFont.boldSystemFont(ofSize: 20)
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

#Preview {
    CollectionViewController()
}
