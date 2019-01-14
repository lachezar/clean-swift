import UIKit
import CleanSwift

public final class JustCellsVC: UIViewController, Interface, TableContainer {
  // MARK: - Properties
  public let router: JustCellsRouter
  public let interactor: JustCellsInteractor
  public var tableView: UITableView {
    return router.contentView.tableView
  }

  lazy var tableManager = TableManager(tableContainer: self)

  // MARK: - Initialization
  public init(router: JustCellsRouter, interactor: JustCellsInteractor) {
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

    title = "Self Sizing cells"
    presenter.state = .listCells

    handleButtons()
  }

  public override func loadView() {
    view = router.contentView
  }

  private func handleButtons() {
    router.contentView.showCildrensCountButton
      .addTarget(self, action: #selector(childernsCountTapped), for: .touchUpInside)
    router.contentView.appendButton
      .addTarget(self, action: #selector(appendNewRowTapped), for: .touchUpInside)
  }

  @objc
  func childernsCountTapped() {
    print("Child VCs: \(children.count)")
  }

  @objc
  func appendNewRowTapped() {
    presenter.state = .appendRow
  }
}
