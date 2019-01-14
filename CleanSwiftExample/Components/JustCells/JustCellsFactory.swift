import Foundation

extension Screen {
  public static var justCells: JustCellsVC {
    let router     = JustCellsRouter()
    let presenter  = JustCellsPresenter()
    let interactor = JustCellsInteractor(presenter: presenter)
    let interface  = JustCellsVC(router: router, interactor: interactor)

    presenter.interface = interface
    router.interface    = interface

    return interface
  }
  // public static func justCells() -> JustCellsVC {
  // }
}
