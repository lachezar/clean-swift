import Foundation
import CleanSwift

public final class SectionsInteractor: Interactor {
  // MARK: - Properties
  public let presenter: SectionsPresenter

  // MARK: - Initialization
  public init(presenter: SectionsPresenter) {
    self.presenter = presenter
  }
}
