import UIKit

public protocol ElementModel {}

public protocol ElementTemplate: AnyObject {
  var contentView: UIView { get }
  var height: CGFloat { get }

  func configure(model: ElementModel, path: IndexPath)
  func displayComponent(in container: UIViewController)
  func removeComponent()
}

extension ElementTemplate {
//  public func test() {
//    print("ElementTemplate: \(type(of: self))")
//  }
  public func displayComponent(in container: UIViewController) {}
  public func removeComponent() {}
}
