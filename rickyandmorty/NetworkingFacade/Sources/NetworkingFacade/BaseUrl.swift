import Foundation
import Pager
import Networking

public extension HttpRequestProtocol {
  var baseUrl: URL {
    guard let url = URL(string: "https://rickandmortyapi.com") else {
      fatalError("Invalid Base Url")
    }
    return url
  }
}

public struct HttpRequest: HttpRequestProtocol {
  public var path: String
  public var method: HttpMethod
  public var queryItems: [URLQueryItem]?
  public var body: Data?
  public var headers: [String : String]

  public init(path: String,
              method: HttpMethod = .GET,
              queryItems: [URLQueryItem]? = nil,
              body: Data? = nil,
              headers: [String : String] = [:]) {
    self.path = path
    self.method = method
    self.queryItems = queryItems
    self.body = body
    self.headers = headers
  }
}

public struct PageableHttpRequest: PageableHttpRequestProtocol {
  public var path: String
  public var method: HttpMethod
  public var queryItems: [URLQueryItem]?
  public var body: Data?
  public var headers: [String : String]
  public var pageQueryParameterName: String
  public var pageSizeQueryParameterName: String
  public var pageSize: UInt

  public init(path: String,
              method: HttpMethod = .GET,
              queryItems: [URLQueryItem]? = nil,
              body: Data? = nil,
              headers: [String : String] = [:],
              pageQueryParameterName: String = "page",
              pageSizeQueryParameterName: String = "count",
              pageSize: UInt = 20) {
    self.path = path
    self.method = method
    self.queryItems = queryItems
    self.body = body
    self.headers = headers
    self.pageQueryParameterName = pageQueryParameterName
    self.pageSizeQueryParameterName = pageSizeQueryParameterName
    self.pageSize = pageSize
  }
}
