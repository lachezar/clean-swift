import Foundation

extension Screen {
  public static var menu: MenuVC {
    let router     = MenuRouter()
    let presenter  = MenuPresenter()
    let interactor = MenuInteractor(presenter: presenter)
    let interface  = MenuVC(router: router, interactor: interactor)

    presenter.interface = interface
    router.interface    = interface

    return interface
  }
  // public static func menu() -> MenuVC {
  // }
}
