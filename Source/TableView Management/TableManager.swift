import UIKit
import Differ

public final class TableManager: NSObject, UITableViewDataSource, UITableViewDelegate {
  // MARK: - Properties
  public typealias Container = TableContainer & UIViewController

  public weak var tableView: UITableView? {
    return container?.tableView
  }

  // Store registered cells reuseIdentifiers
  private var cellsReuseIDs = Set<String>()

  // Store Sections for the table
  public private(set) var sections: [Section] = []

  weak var container: Container?

  // MARK: - Initialization
  public init(tableContainer: Container) {
    self.container = tableContainer

    super.init()

    tableView?.delegate = self
    tableView?.dataSource = self
  }

  // MARK: - public 💙
  public func reloadData(sections: [Section]) {
    self.sections = sections
    tableView?.reloadData()
  }

  public func update(with rows: [RowProtocol], inSectionAt index: Int) {
    guard sections.indices.contains(index) else {
      fatalError("Missing section at index: \(index)")  }

    let section = sections[index]
    let old = section.rows.map(RowContainer.init)
    let new = rows.map(RowContainer.init)
    let diff = old.extendedDiff(new)

    // skip updating if there is no updates
    guard !diff.isEmpty else {
      return }
    let updates = BatchUpdate(diff: diff) { [index, $0.row] }

    sections[index].set(rows: rows)

    tableView?.beginUpdates()
    tableView?.deleteRows(at: updates.deletions, with: .automatic)
    tableView?.insertRows(at: updates.insertions, with: .automatic)
    tableView?.endUpdates()
  }

  // MARK: - Internal 🧡
  func registerCell(row: RowProtocol) {
    let reuseIdentifier = row.reuseIdentifier
    // Do nothing if cell reuse identifier is already registered.
    guard !cellsReuseIDs.contains(reuseIdentifier) else {
      return }

    // retister the cell
    tableView?.register(row.cellType, forCellReuseIdentifier: reuseIdentifier)
    cellsReuseIDs.insert(reuseIdentifier)
  }

  func row(for path: IndexPath) -> RowProtocol {
    let section = sections[path.section]
    let row = section.rows[path.row]

    return row
  }
}

// MARK: - TableContainer Protocol
public protocol TableContainer: AnyObject {
  var tableView: UITableView { get }
}

// swiftlint:disable private_over_fileprivate
fileprivate struct RowContainer: Equatable {
  let row: RowProtocol

  static func == (lhs: RowContainer, rhs: RowContainer) -> Bool {
    return lhs.row.id == rhs.row.id
  }
}
