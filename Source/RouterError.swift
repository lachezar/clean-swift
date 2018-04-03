import Foundation

public enum RouterError: LocalizedError {
  case missingNavigationController(String)

  public var errorDescription: String? {
    switch self {
    case .missingNavigationController(let typeName):
      return "Missing Navigation Gontroller attached to \(typeName)"
    }
  }
}
