import UIKit
import PinLayout

extension SectionsRouter {
  final class ContentView: UIView {
    // MARK: - Properties
    let tableView = UITableView(frame: .zero, style: .grouped)
    // MARK: - Initialization
    init() {
      super.init(frame: .zero)

      backgroundColor = .green
      tableView.estimatedSectionFooterHeight = 30
      tableView.estimatedSectionHeaderHeight = 30

      addSubview(tableView)
    }
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }

    // MARK: - Layout
    // Use this for flexible sizes
    // override func sizeThatFits(_ size: CGSize) -> CGSize {
    //   self.pin.width(size.width)

    //   return layout()
    // }

    override func layoutSubviews() {
      super.layoutSubviews()
      layout()
    }

    // Use this for flexible sizes
    // @discardableResult
    // fileprivate func layout() -> CGSize {
    // }

    fileprivate func layout() {
      tableView.pin.horizontally().bottom().top(self.pin.safeArea)
    }
  }
}
