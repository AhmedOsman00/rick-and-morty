import Foundation

public struct APIError: Error, Equatable, Decodable {
    let error: String
}
