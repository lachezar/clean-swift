import UIKit

extension UIViewController {
  /// add child vc and his view into parent vc
  public func add(_ child: UIViewController) {
    addChildViewController(child)
    view.addSubview(child.view)
    child.didMove(toParentViewController: self)
  }
  /// add child vc and pass his view to a closure
  public func add(_ child: UIViewController, closure: (UIView) -> Void) {
    addChildViewController(child)
    closure(child.view)
    child.didMove(toParentViewController: self)
  }

  /// Remove child view controller from his parent
  public func remove() {
    guard parent != nil else {
      return
    }

    willMove(toParentViewController: nil)
    removeFromParentViewController()
    view.removeFromSuperview()
  }
}
