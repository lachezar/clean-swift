import UIKit

public protocol RowProtocol: AnyObject {
  var id: UUID { get }
  var reuseIdentifier: String { get }
  var cellType: AnyClass { get }

  var height: CGFloat { get }

  func configure(_ cell: UITableViewCell, path: IndexPath)
  func displayComponent(in container: UIViewController)
  func removeComponent()

  // MARK: - Editing
  var editable: Bool { get set }

  // MARK: - Events
  typealias RowClosure = (RowProtocol) -> Void
  var highlightable: Bool { get set }

  var onDequeue: RowClosure? { get set }
  var onHighlight: RowClosure? { get set }

  func onDequeue(_ closure: @escaping RowClosure) -> Self
  func onHighlight(_ closure: @escaping RowClosure) -> Self
}
