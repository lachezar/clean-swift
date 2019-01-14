import Foundation
import CleanSwift

public final class MenuInteractor: Interactor {
  // MARK: - Properties
  public let presenter: MenuPresenter

  // MARK: - Initialization
  public init(presenter: MenuPresenter) {
    self.presenter = presenter
  }
}
