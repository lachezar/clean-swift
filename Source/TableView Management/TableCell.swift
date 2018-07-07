import UIKit

public protocol TableCell: AnyObject {
  associatedtype Model
  associatedtype Component: Interface & UIViewController

  var component: Component! { get set }
  var height: CGFloat { get }

  // configure the cell after component being set
  func configure(_ model: Model, path: IndexPath)
}

extension TableCell where Self: UITableViewCell {
  func displeyComponent<Container>(in container: Container) where Container: UIViewController {
    container.add(component) { contentView.addSubview($0) }
  }

  func configure(component: Component) {
    self.component = component
  }

  func removeComponent() {
    print("REMOVE COMPONENT")
    component.remove()
  }
}
