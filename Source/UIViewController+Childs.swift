import UIKit

extension UIViewController {
  public func add(_ child: UIViewController, containerView: UIView? = nil) {
    addChildViewController(child)
    let view: UIView = containerView ?? self.view
    view.addSubview(child.view)
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
