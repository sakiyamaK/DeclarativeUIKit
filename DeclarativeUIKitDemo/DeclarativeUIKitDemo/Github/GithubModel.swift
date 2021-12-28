import Foundation

struct GithubResponse: Codable {
  let items: [GithubModel]?
}

struct GithubModel: Codable {
    let id: Int
    let fullName: String?
    let description: String?
    let stargazersCount: Int?
    let language: String?
    let license: LlicenseModel?
    let updatedAt: Date?

    var urlStr: String {
        "https://github.com/\(fullName ?? "")"
    }

    struct LlicenseModel: Codable {
        let name: String?
    }
    
}

extension GithubModel {
  private static var jsonStr: String {
    """
    {
        "id": 44838949,
        "full_name": "apple/swift",
        "description": "The Swift Programming Language",
        "stargazers_count": 58316,
        "language": "C++",
        "updated_at": "2021-12-24T16:18:04Z",
        "license": {
            "name": "Apache License 2.0"
        }
    }
    """
  }

  static var sample: GithubModel {
    try! GithubAPI.shared.decoder.decode(GithubModel.self, from: GithubModel.jsonStr.data(using: .utf8)!
    )
  }
}
