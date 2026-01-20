import Foundation
import Pager
import Networking

public enum RickAndMortyAPI: CaseIterable {
  case characters
  case episodes

  var request: any HttpRequestProtocol {
    switch self {
    case .characters:
      PageableHttpRequest(path: "/api/character")
    case .episodes:
      HttpRequest(path: "/api/episode")
    }
  }
}

public extension PagerProtocol {
  func nextPage<T: Pageable>(_ endpoint: RickAndMortyAPI,
                             _ decoder: DataDecoder = JSONDecoder()) async throws -> T? {
    guard let request = endpoint.request as? (any PageableHttpRequestProtocol) else {
      fatalError("Unexpected request type")
    }

    return try await nextPage(request: request, decoder: decoder)
  }

  func firstPage<T: Pageable>(_ endpoint: RickAndMortyAPI,
                             _ decoder: DataDecoder = JSONDecoder()) async throws -> T? {
    guard let request = endpoint.request as? (any PageableHttpRequestProtocol) else {
      fatalError("Unexpected request type")
    }

    return try await firstPage(request: request, decoder: decoder)
  }
}
