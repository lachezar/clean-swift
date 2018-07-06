import Foundation
import CleanSwift

public final class TestScreenInteractor: Interactor {
  // MARK: - Properties
  public let presenter: TestScreenPresenter

  // MARK: - Initialization
  public init(presenter: TestScreenPresenter) {
    self.presenter = presenter
  }
}
