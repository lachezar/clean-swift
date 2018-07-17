import UIKit

public protocol Presenter: AnyObject {
  associatedtype InterfaceType: UIViewController, Interface

  var interface: InterfaceType! { get set }
}

extension Presenter {
  public var router: Self.InterfaceType.RouterType {
    return interface.router
  }
  public var interactor: Self.InterfaceType.InteractorType {
    return interface.interactor
  }
}
