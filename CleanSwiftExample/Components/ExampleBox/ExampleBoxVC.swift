import UIKit
import CleanSwift

public final class ExampleBoxVC: UIViewController, Interface {
  // MARK: - Properties
  public let router: ExampleBoxRouter
  public let interactor: ExampleBoxInteractor

  // MARK: - Initialization
  public init(router: ExampleBoxRouter, interactor: ExampleBoxInteractor) {
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
  }

  public override func loadView() {
    view = router.contentView
  }

  // MARK: - API
  public func set(text: String) {
    router.contentView.textLabel.text = text
  }

  deinit {
    print("Deinit JustCellBox")
  }
}
