import Foundation
import Combine
import UIExtensions

struct CharactersViewData: Equatable {
  let items: [CharacterUiModel]
  let filters: [FilterUiModel]

  init(items: [CharacterUiModel] = [],
       filters: [FilterUiModel] = Status.allCases.map { .init($0) }) {
    self.items = items
    self.filters = filters
  }
}

public final class CharactersViewModel {
  @Published private var allItems: [CharacterUiModel] = []
  @Published private(set) var state = ViewState<CharactersViewData>.idle
  @Published private var filters: [FilterUiModel] = Status.allCases.map { .init($0) }

  private let dataSource: CharactersRemoteDataSourceInterface

  public init(dataSource: CharactersRemoteDataSourceInterface) {
    self.dataSource = dataSource
    bind()
  }

  private func bind() {
    Publishers.CombineLatest($allItems, $filters)
      .map { items, filters -> ViewState<CharactersViewData> in
        guard let selectedFilter = filters.first(where: { $0.isSelected }) else {
          return .data(.init(items: items, filters: filters))
        }
        let filteredItems = items.filter { $0.status == selectedFilter.status }
        return .data(.init(items: filteredItems, filters: filters))
      }
      .assign(to: &$state)
  }

  func fetchCharacters() async {
    state = .loading

    do {
      guard let fetchedItems = try await dataSource.getCharacters() else { return }
      allItems = fetchedItems.results.map { CharacterUiModel($0) }
    } catch {
      state = .error(error.localizedDescription)
    }
  }

  func fetchMoreCharacters() async {
    do {
      guard let fetchedItems = try await dataSource.getNextCharacters() else { return }
      allItems.append(contentsOf: fetchedItems.results.map { CharacterUiModel($0) })
    } catch {
      state = .error(error.localizedDescription)
    }
  }

  func filterCharacters(by status: Status) {
    filters = filters.map { filter in
      let isSelected = (filter.status == status) ? !filter.isSelected : false
      return .init(status: filter.status, isSelected: isSelected)
    }
  }
}
