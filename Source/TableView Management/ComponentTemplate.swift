import UIKit

public protocol Componentable {
  associatedtype Component: UIViewController

  var component: Component? { get }
}

public protocol ComponentTemplate: ElementTemplate, Componentable {}

extension ComponentTemplate {
  public func displayComponent(in container: UIViewController) {
    if
      let component = self.component {
      container.add(component) { contentView.addSubview($0) }
    }
  }
  public func removeComponent() {
    component?.remove()
  }
}
