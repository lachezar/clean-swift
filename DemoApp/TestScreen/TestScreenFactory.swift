import Foundation
import CleanSwift

// MARK: - Factory
public protocol TestScreenFactory {
  func testScreenComponent() -> TestScreenVC
}

extension ComponentsContainer: TestScreenFactory {
  public func testScreenComponent() -> TestScreenVC {
    let router = TestScreenRouter(factory: self)
    let presenter = TestScreenPresenter()
    let interactor = TestScreenInteractor(presenter: presenter)
    let interface = TestScreenVC(router: router, interactor: interactor)

    presenter.interface = interface
    router.interface = interface

    return interface
  }
}
