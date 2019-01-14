import UIKit
import PinLayout

extension JustCellsRouter {
  final class ContentView: UIView {
    // MARK: - Properties
    let tableView = UITableView()
    let showCildrensCountButton: UIButton = {
      let b = UIButton(type: .system)
      b.setTitle("Childs Count", for: .normal)
      return b
    }()
    let appendButton: UIButton = {
      let b = UIButton(type: .system)
      b.setTitle("Append Row", for: .normal)
      return b
    }()
    // MARK: - Initialization
    init() {
      super.init(frame: .zero)

      backgroundColor = .yellow
      tableView.tableFooterView = UIView()
      tableView.estimatedRowHeight = 20

      addSubview(tableView)
      addSubview(showCildrensCountButton)
      addSubview(appendButton)
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
      tableView.pin.left().right().bottom(self.pin.safeArea.bottom + 50).top(self.pin.safeArea)
      showCildrensCountButton.pin.left(16).height(44).sizeToFit(.height).bottom(self.pin.safeArea)
      appendButton.pin.right(16).height(44).sizeToFit(.height).bottom(self.pin.safeArea)
    }
  }
}
