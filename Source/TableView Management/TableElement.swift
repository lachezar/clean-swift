import UIKit

public class TableElement {
  typealias Template = ElementTemplate

  // MARK: - Properties
  public let reuseIdentifier: String
  let reuseType: AnyClass

  public private(set) var model: ElementModel

  private(set) weak var template: Template!
  public private(set) var indexPath: IndexPath!

  public var height: CGFloat {
    if let template = template,
      template.height != 0 {
      return template.height
    }

    return UITableView.automaticDimension
  }

  // MARK: - Initialization
  public init(model: ElementModel, templateClass: AnyClass) {
    self.model = model
    self.reuseIdentifier = String(describing: templateClass)
    self.reuseType = templateClass
  }

  // MARK: - Public 💚
  public func displayComponent(in container: UIViewController) {
    template?.displayComponent(in: container)
  }

  public func removeComponent() {
    template?.removeComponent()
  }

  // MARK: - Internal 🧡
  public func configure(template: UIView, path: IndexPath) {
    guard let tableTemplate = template as? Template else {
      fatalError("provided UIView doesn't conforms to ElementTemplate")
    }

    // resetting cell component
    tableTemplate.removeComponent()

    self.template = tableTemplate
    indexPath     = path
    self.template.configure(model: model, path: path)
  }
}
