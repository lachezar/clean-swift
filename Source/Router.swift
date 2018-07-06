import UIKit

public protocol Router: AnyObject {
  associatedtype Interface: UIViewController
  associatedtype Factory

  var interface: Interface! { get set }
  var factory: Factory { get }

  init(factory: Factory)
}

extension Router {
  public func push(to vc: UIViewController, animated: Bool = true) throws {
    guard let nVC = interface.navigationController else {
      throw RouterError.missingNavigationController("\(type(of: interface))")
    }

    nVC.pushViewController(vc, animated: animated)
  }
}
