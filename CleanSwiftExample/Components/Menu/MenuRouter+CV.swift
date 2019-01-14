import UIKit
import PinLayout

extension MenuRouter {
  final class ContentView: UIView {
    // MARK: - Properties
    let tableView = UITableView()
    // MARK: - Initialization
    init() {
      super.init(frame: .zero)
      
      backgroundColor = .gray

      tableView.tableFooterView = UIView()

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
      tableView.pin.left().right().bottom().top(self.pin.safeArea)
    }
  }
}
