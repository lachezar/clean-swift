import UIKit

// swiftlint:disable type_name
public final class Row<Cell: TableCell>: RowProtocol where Cell: UITableViewCell {

  // MARK: - Properties
  public let id = UUID()
  public var reuseIdentifier: String {
    return String(describing: Cell.self)
  }

  public private(set) var model: Cell.Model
  public let component: Cell.Component

  public var cellType: AnyClass {
    return Cell.self
  }

  public var editable: Bool = false

  // Store cell and indexPath
  private weak var _cell: UITableViewCell?
  private var cell: Cell? {
    return _cell as? Cell
  }
  private var path: IndexPath?

  public var height: CGFloat {
    guard let height = cell?.height else {
      return UITableView.automaticDimension
    }

    return height
  }

  // MARK: - Initialization
  public init(model: Cell.Model, component: Cell.Component) {
    self.model = model
    self.component = component
  }

  // MARK: - Public 💙
  public func configure(_ cell: UITableViewCell, path: IndexPath) {
    _cell = cell
    // Always configure component first
    self.cell?.configure(component: component)
    self.cell?.configure(model, path: path)
  }

  public func displayComponent(in container: UIViewController) {
    cell?.displeyComponent(in: container)
  }
  public func removeComponent() {
    cell?.removeComponent()
  }

  public func update(model: Cell.Model) {
    self.model = model
    guard let path = path else {
      return }

    cell?.configure(model, path: path)
  }

  // MARK: Events
  public var highlightable: Bool = true
  public var onDequeue: RowProtocol.RowClosure?
  public var onHighlight: RowProtocol.RowClosure?

  public func onDequeue(_ closure: @escaping RowProtocol.RowClosure) -> Self {
    onDequeue = closure
    return self
  }

  public func onHighlight(_ closure: @escaping RowProtocol.RowClosure) -> Self {
    onHighlight = closure
    return self
  }

  // MARK: - Internal 🧡
}
