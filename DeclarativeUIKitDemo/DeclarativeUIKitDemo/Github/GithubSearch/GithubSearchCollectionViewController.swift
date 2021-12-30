import UIKit
import DeclarativeUIKit

final class GithubSearchCollectionViewController: UIViewController {
    
    private enum ViewTag: Int {
        case collectionView = 1
        case activityIndicatorStack
        case activityIndicator
        case startStack
        case searchTextField
        case searchButton
    }
    
    private var collectionView: UICollectionView {
        self.getView(tag: ViewTag.collectionView.rawValue) as! UICollectionView
    }
    private var activityIndicatorStack: UIStackView {
        self.getView(tag: ViewTag.activityIndicatorStack.rawValue) as! UIStackView
    }
    private var activityIndicator: UIActivityIndicatorView {
        self.getView(tag: ViewTag.activityIndicator.rawValue) as! UIActivityIndicatorView
    }
    private var startStack: UIStackView {
        self.getView(tag: ViewTag.startStack.rawValue) as! UIStackView
    }
    private var searchTextField: UISearchTextField {
        self.getView(tag: ViewTag.searchTextField.rawValue) as! UISearchTextField
    }
    private var searchButton: UIButton {
        self.getView(tag: ViewTag.searchButton.rawValue) as! UIButton
    }

    private var presenter: GithubSearchPresenterInput!
    func inject(presenter: GithubSearchPresenterInput) {
      self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    
        self.declarate {
            UIStackView.vertical {
                UIStackView.horizontal {
                    UIView.spacer().width(12)

                    UIView().zStack(margin: .init(top: 0, left: 0, bottom: 0, right: 0) ) {
                        UISearchTextField {
                            guard let textField = $0 as? UISearchTextField else { return }
                            textField.placeholder = "検索してね"
                        }
                        .tag(ViewTag.searchTextField.rawValue)
                    }
                    .border(color: .lightGray, width: 1)
                    .cornerRadius(8)
                    .height(32)

                    UIView.spacer().width(12)

                    UIButton {
                        guard let button = $0 as? UIButton else { return }
                        button.setImage(UIImage(systemName: "magnifyingglass.circle"), for: .normal)
                        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
                    }
                    .contentMode(.scaleAspectFit)
                    .tag(ViewTag.searchButton.rawValue)
                    
                    UIView.spacer().width(16)
                }
                
                UIView.spacer().height(10)
                UIView.spacer().height(0.5).backgroundColor(.gray)
                UIView.spacer().height(10)

                UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
                    .imperative {
                    guard let collectionView = $0 as? UICollectionView else { return }
                        collectionView.delegate = self
                        collectionView.dataSource = self
                        collectionView.register(GithubSearchCollectionViewCell.self, forCellWithReuseIdentifier: GithubSearchCollectionViewCell.reuseIdentifier)
                    }
                    .isHidden(true)
                    .tag(ViewTag.collectionView.rawValue)
                
                UIStackView.vertical {
                    UIView.spacer().height(100)
                    UIActivityIndicatorView()
                        .tag(ViewTag.activityIndicator.rawValue)
                    UIView.spacer()
                }
                .tag(ViewTag.activityIndicatorStack.rawValue)
                .isHidden(true)
                
                UIStackView.vertical {
                    UIView.spacer().height(60)
                    UILabel {
                        guard let label = $0 as? UILabel else { return }
                        label.text = "検索ワードを入力してください"
                        label.textAlignment = .center
                    }
                    UIView.spacer()
                }.tag(ViewTag.startStack.rawValue)
            }
        }
    }
}

extension GithubSearchCollectionViewController: GithubSearchPresenterOutput {
  func update(loading: Bool) {
    DispatchQueue.main.async { [weak self] in
        guard let self = self else { return }        
        self.collectionView.isHidden = loading
        self.activityIndicatorStack.isHidden = !loading
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

@objc extension GithubSearchCollectionViewController {
    func tapButton(_ sender: UIButton) {
        guard
            let viewTag = ViewTag(rawValue: sender.tag)
        else { return }
        let searchParameter: GithubSearchParameters = .init(searchWord: searchTextField.text)
        switch viewTag {
        case .searchButton:
            presenter.search(parameters: searchParameter)
        default:
            break
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

private struct ViewController_Wrapper: UIViewControllerRepresentable {
    typealias ViewController = GithubSearchCollectionViewController
    
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

    func makeUIViewController(context: Context) -> ViewController {
        let vc = ViewController()
        let presenter = GithubSearchPresenterMock(output: vc)
        vc.inject(presenter: presenter)
        vc.update(loading: false)
        return vc
    }

    func updateUIViewController(_ vc: ViewController, context: Context) {
    }
}

struct GithubSearchCollectionViewController_Previews: PreviewProvider {
  static var previews: some View {
      Group {
          ViewController_Wrapper()
      }
  }
}
