import UIKit
import CleanSwift

public final class TestScreenVC: UIViewController, Interface {
  // MARK: - Properties
  public let router: TestScreenRouter
  public let interactor: TestScreenInteractor

  // MARK: - Initialization
  public init(router: TestScreenRouter, interactor: TestScreenInteractor) {
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
  }
}
