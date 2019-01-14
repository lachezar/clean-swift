import UIKit
import CleanSwift

public final class MenuVC: UIViewController, Interface, TableContainer {

  // MARK: - Properties
  public let router: MenuRouter
  public let interactor: MenuInteractor
  public var tableView: UITableView {
    return router.contentView.tableView
  }
  lazy var tableManager = TableManager(tableContainer: self)

  // MARK: - Initialization
  public init(router: MenuRouter, interactor: MenuInteractor) {
    self.router = router
    self.interactor = interactor

    super.init(nibName: nil, bundle: nil)
  }

  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Lifecycle
  public override func viewDidLoad() {
    super.viewDidLoad()
    router.buildUI()

    title = "Menu"
    presenter.state = .listMenus
  }

  public override func loadView() {
    view = router.contentView
  }

  // MARK: - Internal 🧡

}
