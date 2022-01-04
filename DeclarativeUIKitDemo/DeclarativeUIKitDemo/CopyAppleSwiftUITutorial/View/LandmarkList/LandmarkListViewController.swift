//
//  LandmarkListViewController.swift
//  DeclarativeUIKitDemo
//
//  Created by sakiyamaK on 2021/12/30.
//

import UIKit
import DeclarativeUIKit

final class LandmarkListViewController: UIViewController {
    
    private enum ViewTag: Int {
        case collectionView = 1
    }
    
    private var landmarks: [Landmark] = []
    private var isOn: Bool = false
    
    private var filteredLandmarks: [Landmark] {
      landmarks.filter {
        !isOn || $0.isFavorite
      }
    }

    func inject(landmarks: [Landmark], isOn: Bool) {
        self.landmarks = landmarks
        self.isOn = isOn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "Landmarks"
        
        self.declarative {
            UICollectionView {
                UICollectionViewCompositionalLayout { (section, environment) -> NSCollectionLayoutSection? in
                    
                    let height: CGFloat = 40
                    
                    let itemSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .estimated(height)
                    )
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)

                    let groupSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .estimated(height)
                    )
                    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                    group.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
                    
                    let section = NSCollectionLayoutSection(group: group)
                    section.contentInsets = .init(top: 16, leading: 0, bottom: 0, trailing: 0)
                    
                    return section
                }
            }
            .tag(ViewTag.collectionView.rawValue)
            .delegate(self)
            .dataSource(self)
            .registerCellClass(ToggleRow.self, forCellWithReuseIdentifier: "ToggleRow")
            .registerCellClass(LandmarkRow.self, forCellWithReuseIdentifier: "LandmarkRow")
            .refreshControl {
                UIRefreshControl {
                    let refreshControll = $0 as! UIRefreshControl
                    refreshControll.addTarget(self, action: #selector(refresh), for: .valueChanged)
                }
            }
        }
    }
}

@objc private extension LandmarkListViewController {
    func refresh(_ sender: UIRefreshControl) {
        print("refresh")
        if sender.isRefreshing {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                sender.endRefreshing()
            }
        }
    }
}

extension LandmarkListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.row > 0 else { return }
        let landmark = landmarks[indexPath.row - 1]
        let vc = LandmarkDetailViewController()
        vc.inject(landmark: landmark)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension LandmarkListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredLandmarks.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ToggleRow", for: indexPath) as! ToggleRow
            cell.configure(isOn: self.isOn)
            cell.toggleAction = {[weak self] (isOn) in
                self?.isOn = isOn
                let collectionView = self?.getView(tag: ViewTag.collectionView.rawValue) as! UICollectionView
                collectionView.reloadData()
            }
            return cell
        }
        let landmark = filteredLandmarks[indexPath.row - 1]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LandmarkRow", for: indexPath) as! LandmarkRow
        cell.configure(landmark: landmark)
        return cell
    }
}

import SwiftUI

private struct ViewController_Wrapper: UIViewControllerRepresentable {
    typealias ViewController = LandmarkListViewController
    
    var landmarks: [Landmark]
    
    func makeUIViewController(context: Context) -> ViewController {
        let vc = ViewController()
        vc.inject(landmarks: landmarks, isOn: false)
        return vc
    }
    
    func updateUIViewController(_ vc: ViewController, context: Context) {
    }
}

struct LandmarkListViewController_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewController_Wrapper(landmarks: ModelData.landmarks)
        }
    }
}
