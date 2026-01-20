import Foundation

public enum ViewState<T: Equatable>: Equatable {
  case idle
  case loading
  case error(String)
  case data(T)
}
