import UIKit
import CleanSwift

public final class MenuRouter: Router, Routable, RoutableDelegate {
  public enum Route: RouteProtocol {
    case start
    case justCells
    case customSections
  }
  // MARK: - Properties
  public weak var interface: MenuVC!

  public var route: Route! = .start { didSet { performRoute() } }

  let contentView = ContentView()

  // MARK: - Initialization
  public init() {}

  // MARK: - Public 💚
  public func performRoute() {
    let route: Route = self.route

    switch route {
    case .start:
      return
    case .justCells:
      push(to: Screen.justCells)
    case .customSections:
      push(to: Screen.sections)
    }
  }

  public func moveTo<T>(route: T) where T : RouteProtocol {
    guard let route = route as? Route else { fatalError("route must be \(Route.self)") }
    self.route = route
  }

  // MARK: - UI 🖥
  func buildUI() {}
}
