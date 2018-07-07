import UIKit

public protocol Router: AnyObject {
  associatedtype Interface: UIViewController
  associatedtype Factory

  var interface: Interface! { get set }
  var factory: Factory { get }

  init(factory: Factory)
}

extension Router {
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
