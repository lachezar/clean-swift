import UIKit
import CleanSwift

public final class SectionsVC: UIViewController, Interface, TableContainer {
  // MARK: - Properties
  public let router: SectionsRouter
  public let interactor: SectionsInteractor

  public var tableView: UITableView {
    return router.contentView.tableView
  }
  lazy var tableManager = TableManager(tableContainer: self)

  // MARK: - Initialization
  public init(router: SectionsRouter, interactor: SectionsInteractor) {
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

    title = "Custom Sections"
    presenter.state = .listSections
  }

  public override func loadView() {
    view = router.contentView
  }
}
