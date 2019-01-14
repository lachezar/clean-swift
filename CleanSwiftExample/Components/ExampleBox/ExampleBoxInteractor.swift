import Foundation
import CleanSwift

public final class ExampleBoxInteractor: Interactor {
  // MARK: - Properties
  public let presenter: ExampleBoxPresenter

  // MARK: - Initialization
  public init(presenter: ExampleBoxPresenter) {
    self.presenter = presenter
  }
}
