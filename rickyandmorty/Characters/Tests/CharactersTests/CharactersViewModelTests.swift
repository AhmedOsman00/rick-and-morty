import Testing
import Foundation
import Combine
@testable import Characters

struct CharactersViewModelTests {
  let viewModel: CharactersViewModel
  let mockDataSource: MockCharactersRemoteDataSource
  let cancellables: Set<AnyCancellable>

  let character1 = Character(name: "Test1",
                             status: "Alive",
                             species: "",
                             gender: "",
                             image: URL(string: "https://example.com")!,
                             origin: .init(name: ""))
  let character2 = Character(name: "Test2",
                             status: "Dead",
                             species: "",
                             gender: "",
                             image: URL(string: "https://example.com")!,
                             origin: .init(name: ""))

  init() {
    mockDataSource = MockCharactersRemoteDataSource()
    viewModel = CharactersViewModel(dataSource: mockDataSource)
    cancellables = []
  }

  @Test
  func fetchCharactersSuccess() async {
    // Given
    mockDataSource.mockCharacters = createCharacters()

    // When
    await viewModel.fetchCharacters()

    // Then
    #expect(viewModel.state == .data(.init(items: [.init(character1), .init(character2)])))
  }

  @Test
  func fetchCharactersFailure() async {
    // Given
    mockDataSource.shouldReturnError = true

    // When
    await viewModel.fetchCharacters()

    // Then
    #expect(viewModel.state == .error(URLError(.badServerResponse).localizedDescription))
  }

  @Test
  func fetchMoreCharactersSuccess() async {
    // Given
    mockDataSource.mockCharacters = createCharacters()

    // When
    await viewModel.fetchCharacters()
    mockDataSource.mockCharacters = createCharacters()
    await viewModel.fetchMoreCharacters()

    // Then
    #expect(viewModel.state == .data(.init(items: [
      .init(character1),
      .init(character2),
      .init(character1),
      .init(character2)
    ])))
  }

  @Test
  func filterCharacters() async {
    // Given
    mockDataSource.mockCharacters = createCharacters()

    // When
    await viewModel.fetchCharacters()
    viewModel.filterCharacters(by: .dead)

    // Then
    let expectedFilters = Status.allCases.map { FilterUiModel(status: $0, isSelected: $0 == .dead) }
    #expect(viewModel.state == .data(.init(items: [.init(character2)], filters: expectedFilters)))
  }

  private func createCharacters() -> Characters {
    return Characters(info: .init(pages: 1), results: [character1, character2])
  }
}
