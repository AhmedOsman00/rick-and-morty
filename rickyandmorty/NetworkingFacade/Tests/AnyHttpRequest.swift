import Networking

struct AnyHttpRequest: Hashable {
  private let request: any HttpRequestProtocol

  init(_ request: any HttpRequestProtocol) {
    self.request = request
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(request)
  }

  static func == (lhs: AnyHttpRequest, rhs: AnyHttpRequest) -> Bool {
    lhs.request.hashValue == rhs.request.hashValue
  }
}
