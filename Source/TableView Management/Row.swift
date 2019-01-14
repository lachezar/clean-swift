import UIKit

// swiftlint:disable type_name
public final class Row: TableElement {
  // MARK: - Properties
  public private(set) var id: UUID = UUID()
  public var editable: Bool = false
  public var highlightable: Bool = true

  // MARK: - Events
  public typealias CompleteClosure = (Row) -> Void
  public private(set) var onDequeue: CompleteClosure?
  public private(set) var onHighlight: CompleteClosure?

  @discardableResult
  public func onDequeue(_ closure: @escaping CompleteClosure) -> Row {
    onDequeue = closure
    return self
  }

  @discardableResult
  public func onHighlight(_ closure: @escaping CompleteClosure) -> Row {
    onHighlight = closure
    return self
  }
}

// MARK: - Equitable
extension Row: Equatable {
  public static func == (lhs: Row, rhs: Row) -> Bool {
    return lhs.id == rhs.id
  }
}
