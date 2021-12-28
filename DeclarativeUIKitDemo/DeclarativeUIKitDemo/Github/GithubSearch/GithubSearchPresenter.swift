import Foundation

protocol GithubSearchPresenterInput {
    var numberOfItems: Int { get }
    func item(index: Int) -> GithubModel
    func search(parameters: GithubSearchParameters)
    func didSelect(index: Int)
}

protocol GithubSearchPresenterOutput: AnyObject {
    func update(loading: Bool)
    func update(githubModels: [GithubModel])
    func get(error: Error)
    func showWeb(githubModel: GithubModel)
}

final class GithubSearchPresenter {
    private weak var output: GithubSearchPresenterOutput!
    private var api: GithubAPIProtocol!
    private var githubModels: [GithubModel]
    
    init(output: GithubSearchPresenterOutput, api: GithubAPIProtocol = GithubAPI.shared) {
        self.output = output
        self.api = api
        githubModels = []
    }
}

extension GithubSearchPresenter: GithubSearchPresenterInput {
    var numberOfItems: Int { githubModels.count }
    
    func item(index: Int) -> GithubModel { githubModels[index] }
    
    func didSelect(index: Int) {
        output.showWeb(githubModel: githubModels[index])
    }
    
    func search(parameters: GithubSearchParameters) {
        guard parameters.validation else { return }
        output.update(loading: true)
        api.get(parameters: parameters) { [weak self] result in
            self?.output.update(loading: false)
            switch result {
            case let .success(githubModels):
                self?.githubModels = githubModels
                self?.output.update(githubModels: githubModels)
            case let .failure(error):
                self?.output.get(error: error)
            }
        }
    }
}
