import Foundation

extension Screen {
  public static var sections: SectionsVC {
    let router     = SectionsRouter()
    let presenter  = SectionsPresenter()
    let interactor = SectionsInteractor(presenter: presenter)
    let interface  = SectionsVC(router: router, interactor: interactor)

    presenter.interface = interface
    router.interface    = interface

    return interface
  }
  // public static func sections() -> SectionsVC {
  // }
}
