import Foundation
import CleanSwift

public final class JustCellsInteractor: Interactor {
  // MARK: - Properties
  public let presenter: JustCellsPresenter

  // MARK: - Initialization
  public init(presenter: JustCellsPresenter) {
    self.presenter = presenter
  }
}
