import Foundation

extension UIElement {
  public static var exampleBox: ExampleBoxVC {
    let router     = ExampleBoxRouter()
    let presenter  = ExampleBoxPresenter()
    let interactor = ExampleBoxInteractor(presenter: presenter)
    let interface  = ExampleBoxVC(router: router, interactor: interactor)

    presenter.interface = interface
    router.interface    = interface

    return interface
  }
  // public static func exampleBox() -> JustCellBoxVC {
  // }
}
