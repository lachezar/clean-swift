import UIKit

public protocol Router: class {
  var viewController: UIViewController? { get set }
  var view: UIView? { get set }
}

extension Router {
  public func push(to vc: UIViewController, animated: Bool = true) throws {
    guard let nVC = viewController?.navigationController else {
      throw RouterError.missingNavigationController("\(type(of: view))")
    }

    nVC.pushViewController(vc, animated: true)
  }
}
