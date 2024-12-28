import Foundation

@MainActor
protocol GithubResultWebPresenterInput {
    func viewDidLoad()
}

@MainActor
protocol GithubResultWebPresenterOutput: AnyObject {
    func load(request: URLRequest)
}

final class GithubResultWebPresenter {
    private weak var output: GithubResultWebPresenterOutput!
    private var githubModel: GithubModel
    
    init(output: GithubResultWebPresenterOutput, githubModel: GithubModel) {
        self.output = output
        self.githubModel = githubModel
    }
}

extension GithubResultWebPresenter: GithubResultWebPresenterInput {
    func viewDidLoad() {
        guard let url = URL(string: githubModel.urlStr) else { return }
        output.load(request: URLRequest(url: url))
    }
}
