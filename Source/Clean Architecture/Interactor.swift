import Foundation

public protocol Interactor: AnyObject {
  associatedtype PresenterType: Presenter

  var presenter: PresenterType { get }

  init(presenter: PresenterType)
}

extension Interactor {
  public var interface: Self.PresenterType.InterfaceType {
    return presenter.interface
  }
  public var router: Self.PresenterType.InterfaceType.RouterType {
    return presenter.interface.router
  }
}
