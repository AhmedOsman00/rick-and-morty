import Arrow
import Foundation
import Networking
import NetworkingFacade
import Pager
import Characters
import Router

let container = Container.shared

struct AppContainer: TransientScope {
  func provideHttpClient() -> HttpClient<APIError> {
    HttpClient<APIError>()
  }

  func providePager(client: HttpClient<APIError>) -> PagerProtocol {
    Pager(httpClient: client)
  }

  func provideNavigator() -> Navigator {
    Navigator()
  }

  func provideCharacterDetailsFactory() -> CharacterDetailsFactory {
    { (model) -> CharacterDetailsViewController in
        CharacterDetailsViewController(characterUiModel: model)
    }
  }

  func provideCharactersRemoteDataSource(pager: PagerProtocol) -> CharactersRemoteDataSourceInterface {
    CharactersRemoteDataSource(pager: pager, jsonDecoder: JSONDecoder())
  }

  func provideCharactersViewModel(dataSource: CharactersRemoteDataSourceInterface) -> CharactersViewModel {
    CharactersViewModel(dataSource: dataSource)
  }

  func provideCharactersRouter(navigator: Navigator, factory: @escaping CharacterDetailsFactory) -> CharactersRouter {
    CharactersRouter(navigator: navigator, factory: factory)
  }

  func provideCharactersViewController(viewModel: CharactersViewModel, router: CharactersRouter) -> CharactersViewController {
    CharactersViewController(viewModel: viewModel, router: router)
  }
}
