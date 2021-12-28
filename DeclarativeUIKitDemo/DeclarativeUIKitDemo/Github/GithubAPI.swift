import Foundation

enum GithubError: Error {
    case error, connect, parse
}

struct GithubSearchParameters {
    enum Order: String {
        case desc, asc
    }
    
    enum Sort: String {
        case star
    }
    
    let searchWord: String?
    private var _searchWord: String { searchWord ?? "" }
    let sort: Sort = .star
    let order: Order = .asc
    let perPage: Int = 100
    let page: Int = 0
    
    var validation: Bool {
        !_searchWord.isEmpty && perPage <= 100 && perPage > 0
    }
    
    var queryParameter: String {
        "q=\(_searchWord)&sort=\(sort.rawValue)&order=\(order.rawValue)&per_page=\(perPage)&page=\(page)"
    }
}

extension DateFormatter {
    /// ミリ秒付きのiso8601フォーマット e.g. 2019-08-22T09:30:15.000+0900
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}

protocol GithubAPIProtocol: AnyObject {
    func get(parameters: GithubSearchParameters,
             completion: ((Result<[GithubModel], GithubError>) -> Void)?)
}

final class GithubAPI: GithubAPIProtocol {
    static let shared = GithubAPI()
    private init() {}
    
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(.iso8601)
        return decoder
    }
    
    func get(parameters: GithubSearchParameters,
             completion: ((Result<[GithubModel], GithubError>) -> Void)? = nil)
    {
        guard parameters.validation else {
            completion?(.failure(.error))
            return
        }
        let url = URL(string: "https://api.github.com/search/repositories?\(parameters.queryParameter)")!
        let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: { data, _, _ in
            guard let data = data,
                  let githubResponse = try? self.decoder.decode(GithubResponse.self, from: data),
                  let models = githubResponse.items
            else {
                completion?(.failure(.error))
                return
            }
            completion?(.success(models))
        })
        
        task.resume()
    }
}
