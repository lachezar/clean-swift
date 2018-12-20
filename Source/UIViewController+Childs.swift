import UIKit

extension UIViewController {
  /// add child vc and his view into parent vc
  public func add(_ child: UIViewController) {
    addChild(child)
    view.addSubview(child.view)
    child.didMove(toParent: self)
  }
  /// add child vc and pass his view to a closure
  public func add(_ child: UIViewController, closure: (UIView) -> Void) {
    addChild(child)
    closure(child.view)
    child.didMove(toParent: self)
  }

  /// Remove child view controller from his parent
  public func remove() {
    guard parent != nil else {
      return
    }

    willMove(toParent: nil)
    removeFromParent()
    view.removeFromSuperview()
  }
}
