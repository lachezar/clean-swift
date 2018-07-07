import Foundation
import CleanSwift

public final class TestScreenRouter: Router {
  public typealias Factory = TestScreenFactory

  // MARK: - Properties
  public weak var interface: TestScreenVC!
  public let factory: Factory

  // MARK: - Initialization
  public init(factory: Factory) {
    self.factory = factory
  }
}
