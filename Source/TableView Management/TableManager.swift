import UIKit
import Differ

public final class TableManager: NSObject, UITableViewDataSource, UITableViewDelegate {
  // MARK: - Properties
  public typealias Container = TableContainer & UIViewController
  public typealias TableScroll = () -> Void

  public weak var tableView: UITableView? {
    return container?.tableView
  }

  // Store registered cells and headers/footers reuseIdentifiers
  private var cellsReuseIDs        = Set<String>()
  private var headerFooterReuseIDs = Set<String>()

  // Store Sections for the table
  public private(set) var sections: [Section] = []

  weak var container: Container?

  var tableScrolled: TableScroll?

  // MARK: - Initialization
  public init(tableContainer: Container) {
    self.container = tableContainer

    super.init()

    tableView?.delegate = self
    tableView?.dataSource = self
  }

  // MARK: - Public 💚
  public func reloadData(sections: [Section]) {
    self.sections = sections
    tableView?.reloadData()
  }

  public func update(with rows: [Row], inSectionAt index: Int) {
    guard sections.indices.contains(index) else {
      fatalError("Missing section at index: \(index)")  }

    let section = sections[index]
    let old = section.rows
    let new = rows
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

  @discardableResult
  public func tableScrolled(_ closure: @escaping TableScroll) -> Self {
    tableScrolled = closure
    return self
  }

  // MARK: - Internal 🧡
  func registerCell(row: Row) {
    let reuseIdentifier = row.reuseIdentifier
    // Do nothing if cell reuse identifier is already registered.
    guard !cellsReuseIDs.contains(reuseIdentifier) else {
      return }

    // retister the cell
    tableView?.register(row.reuseType, forCellReuseIdentifier: reuseIdentifier)
    cellsReuseIDs.insert(reuseIdentifier)
  }

  func registerHeaderFooter(_ headerFooter: HeaderFooter) {
    let reuseIdentifier = headerFooter.reuseIdentifier
    // Do nothing if header/footer reuse identifier is already registered.
    guard !headerFooterReuseIDs.contains(reuseIdentifier) else {
      return }

    // register
    tableView?.register(headerFooter.reuseType, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    headerFooterReuseIDs.insert(reuseIdentifier)
  }

  func row(for path: IndexPath) -> Row {
    let section = sections[path.section]
    let row = section.rows[path.row]

    return row
  }

  func header(for section: Int) -> HeaderFooter? {
    let section = sections[section]
    return section.header
  }

  func footer(for section: Int) -> HeaderFooter? {
    let section = sections[section]
    return section.footer
  }
}

// MARK: - TableContainer Protocol
public protocol TableContainer: AnyObject {
  var tableView: UITableView { get }
}
