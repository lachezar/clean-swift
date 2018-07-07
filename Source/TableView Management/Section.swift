import UIKit

public class Section {
  // MARK: - Properties
  public private(set) var rows = [RowProtocol]()

  public var headerTitle: String?
  public var footerTitle: String?

  public var count: Int {
    return rows.count
  }

  // MARK: - Initialization
  public init(rows: [RowProtocol]) {
    self.rows = rows
  }

  // MARK: - Internal 🧡
  func set(rows: [RowProtocol]) {
    self.rows = rows
  }
}
