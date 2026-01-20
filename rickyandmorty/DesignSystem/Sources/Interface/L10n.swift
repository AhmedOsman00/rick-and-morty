public enum L10n {
  public static let characters = String(localized: .characters)
  public static let failedToDecodeTheResponse = String(localized: .failedToDecodeTheResponse)
  public static let noDataWasReceivedFromTheServer = String(localized: .noDataWasReceivedFromTheServer)
  public static let theProvidedUrlIsInvalid = String(localized: .theProvidedUrlIsInvalid)

  public static func location(_ arg1: String) -> String {
    String(localized: .location(arg1))
  }
}
