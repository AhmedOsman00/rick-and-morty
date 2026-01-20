import Testing
import Foundation
@testable import NetworkingFacade

struct RickAndMortyAPITests {
  @Test
  func noDuplicate() {
    // Given
    let requests = RickAndMortyAPI.allCases.map(\.request)

    // When
    let uniqueRequests = Set(requests.map { AnyHttpRequest($0) })

    #expect(uniqueRequests.count == requests.count)
  }

  @Test
  func characters() {
    // Given
    let request = RickAndMortyAPI.characters.request

    // When
    #expect(request.path == "/api/character")
    #expect(request.method == .GET)
    #expect(request.headers.isEmpty)
    #expect(request.queryItems == nil)
    #expect(request.body == nil)
    #expect(request.baseUrl.absoluteString == "https://rickandmortyapi.com")
  }

  @Test
  func episodes() {
    // Given
    let request = RickAndMortyAPI.episodes.request

    // When
    #expect(request.path == "/api/episode")
    #expect(request.method == .GET)
    #expect(request.headers.isEmpty)
    #expect(request.queryItems == nil)
    #expect(request.body == nil)
    #expect(request.baseUrl.absoluteString == "https://rickandmortyapi.com")
  }
}
