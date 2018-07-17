import UIKit

public protocol Router: AnyObject {
  associatedtype InterfaceType: UIViewController, Interface
  associatedtype Factory

  var interface: InterfaceType! { get set }
  var factory: Factory { get }

  init(factory: Factory)
}

extension Router {

  public var interactor: Self.InterfaceType.InteractorType {
    return interface.interactor
  }

  public var presenter: Self.InterfaceType.InteractorType.PresenterType {
    return interface.interactor.presenter
  }

  public func next() {}
  public func back() {
    if interface.navigationController != nil {
      pop()
    }
  }
  public func pop(to vc: UIViewController, animated: Bool = true) {
    guard let nVC = interface.navigationController else {
      fatalError(RouterError.missingNavigationController("\(type(of: interface))").localizedDescription)
    }
    nVC.popToViewController(vc, animated: animated)
  }

  public func pop(to vcClass: AnyClass, animated: Bool = true) {
    guard let nVC = interface.navigationController else {
      fatalError(RouterError.missingNavigationController("\(type(of: interface))").localizedDescription) }
    guard let vc = nVC.viewControllers.first(where: { $0.isKind(of: vcClass) }) else {
      fatalError("Missing \(vcClass) type in navigation stack") }

    nVC.popToViewController(vc, animated: animated)
  }

  public func pop(animated: Bool = true) {
    guard let nVC = interface.navigationController else {
      fatalError(RouterError.missingNavigationController("\(type(of: interface))").localizedDescription) }

    nVC.popViewController(animated: animated)
  }

  public func push(to vc: UIViewController, animated: Bool = true) {
    guard let nVC = interface.navigationController else {
      fatalError(RouterError.missingNavigationController("\(type(of: interface))").localizedDescription)
    }
    nVC.pushViewController(vc, animated: animated)
  }

  public func displayErrorAlert(title: String, message: String) {
    let vc = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    vc.addAction(ok)

    interface.present(vc, animated: true, completion: nil)
  }
}
