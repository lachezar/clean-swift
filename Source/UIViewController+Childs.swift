import UIKit

extension UIViewController {
  public func add(_ child: UIViewController) {
    addChildViewController(child)
    view.addSubview(child.view)
    child.didMove(toParentViewController: self)
  }
  public func add(_ child: UIViewController, closure: (UIViewController) -> Void) {
    addChildViewController(child)
    closure(child)
    child.didMove(toParentViewController: self)
  }

  public func remove() {
    guard parent != nil else {
      return
    }

    willMove(toParentViewController: nil)
    removeFromParentViewController()
    view.removeFromSuperview()
  }
}
