import UIKit
import DeclarativeUIKit

final class GithubSearchCollectionViewController: UIViewController {
    
    private weak var collectionView: UICollectionView!
    private weak var activityIndicatorContianerView: UIView!
    private weak var activityIndicator: UIActivityIndicatorView!
    private weak var startStack: UIStackView!
    private weak var searchTextField: UISearchTextField!
    private weak var searchButton: UIButton!
    
    private var presenter: GithubSearchPresenterInput!
    func inject(presenter: GithubSearchPresenterInput) {
        self.presenter = presenter
    }

    override func loadView() {
        super.loadView()

        self.view.backgroundColor = .white

        self.declarative {
            UIStackView.vertical {
                UIStackView.horizontal {
                    UISearchTextField(assign: &self.searchTextField)
                        .placeholder("検索してね")

                    UIButton(UIImage(systemName: "magnifyingglass.circle"))
                        .addAction(.touchUpInside, handler: { [weak self] _ in
                            let searchParameter: GithubSearchParameters = .init(searchWord: self!.searchTextField.text)
                            self!.presenter.search(parameters: searchParameter)
                        })
                        .contentMode(.scaleAspectFit)
                        .assign(to: &self.searchButton)
                }
                .spacing(12)
                .padding(insets: .init(horizontal: 12))
                
                UIView.divider()
                
                UICollectionView(UICollectionViewFlowLayout())
                    .delegate(self)
                    .dataSource(self)
                    .registerCellClass(GithubSearchCollectionViewCell.self, forCellWithReuseIdentifier: GithubSearchCollectionViewCell.reuseIdentifier)
                    .isHidden(true)
                    .assign(to: &self.collectionView)

                UIActivityIndicatorView(assign: &self.activityIndicator)
                    .center()
                    .offset(y: -100)
                    .assign(to: &self.activityIndicatorContianerView)
                    .isHidden(true)
                
                UIStackView.vertical {
                    UIView.spacer().height(60)
                    UILabel("検索ワードを入力してください")
                        .textAlignment(.center)
                    UIView.spacer()
                }.assign(to: &self.startStack)
            }.spacing(10)
        }
    }
}

extension GithubSearchCollectionViewController: GithubSearchPresenterOutput {
    func update(loading: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.collectionView.isHidden = loading
            self.activityIndicatorContianerView.isHidden = !loading
            if loading {
                self.activityIndicator.startAnimating()
            } else {
                self.activityIndicator.stopAnimating()
            }
            self.activityIndicator.isHidden = !loading
            self.startStack.isHidden = true
        }
    }
    
    func update(githubModels: [GithubModel]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
    }
    
    func get(error: Error) {
        DispatchQueue.main.async {
            print(error.localizedDescription)
        }
    }
    
    func showWeb(githubModel: GithubModel) {
        DispatchQueue.main.async {
            let vc = GithubSearchResultViewController()
            let presenter = GithubResultWebPresenter(output: vc, githubModel: githubModel)
            vc.inject(presenter: presenter)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension GithubSearchCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let githubModel = presenter.item(index: indexPath.item)
        return GithubSearchCollectionViewCell.size(width: collectionView.frame.width, github: githubModel)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelect(index: indexPath.item)
    }
}

extension GithubSearchCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GithubSearchCollectionViewCell.reuseIdentifier, for: indexPath) as! GithubSearchCollectionViewCell
        let githubModel = presenter.item(index: indexPath.item)
        cell.configure(github: githubModel)
        return cell
    }
}

import SwiftUI

#Preview {

    
    final class GithubSearchPresenterMock: GithubSearchPresenterInput {
        
        private weak var output: GithubSearchPresenterOutput!
        
        init(output: GithubSearchPresenterOutput) {
            self.output = output
        }
        
        var numberOfItems: Int { 10 }
        func item(index: Int) -> GithubModel {
            GithubModel.sample
        }
        
        func search(parameters: GithubSearchParameters) {
            print(parameters)
        }
        
        func didSelect(index: Int) {
            print(index)
        }
    }
    
    let vc = GithubSearchCollectionViewController()
    let presenter = GithubSearchPresenterMock(output: vc)
    vc.inject(presenter: presenter)
    vc.update(loading: false)
    return vc
}
