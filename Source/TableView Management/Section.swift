import Foundation

public struct Section {
  // MARK: - Properties
  public private(set) var rows = [Row]()

  public var headerTitle: String?
  public var footerTitle: String?

  public var header: HeaderFooter?
  public var footer: HeaderFooter?

  public var count: Int {
    return rows.count
  }

  // MARK: - Initialization
  public init(rows: [Row]) {
    self.rows = rows
  }

  mutating public func set(rows: [Row]) {
    self.rows = rows
  }
}
