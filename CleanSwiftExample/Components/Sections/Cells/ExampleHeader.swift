import UIKit
import CleanSwift
import PinLayout

final class ExampleHeader: UITableViewHeaderFooterView, ElementTemplate {
  
  struct Model: ElementModel {
    let title: String
  }


  // MARK: - Properties

  let height: CGFloat = 44


  // MARK: - UI

  let titleLabel: UILabel = {
    let l = UILabel(frame: .zero)
    l.text = ""
    l.font = UIFont.systemFont(ofSize: 16)
    l.textColor = .white
    l.numberOfLines = 0

    return l
  }()


  // MARK: - Initialization

  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)

    backgroundView = UIView()
    backgroundView?.backgroundColor = .black

    contentView.addSubview(titleLabel)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  // MARK: - ElementTemplate

  func configure(model: ElementModel, path: IndexPath) {
    guard let model = model as? Model else {
      return }

    titleLabel.text = model.title
  }


  // MARK: - Override

  override func layoutSubviews() {
    super.layoutSubviews()
    layout()
  }

  // Uncomment it for self sizing cells
  //  override func sizeThatFits(_ size: CGSize) -> CGSize {
  //    contentView.pin.width(size.width)
  //    layout()
  //  }

  private func layout() {
    titleLabel.pin.top().bottom().horizontally(16)
  }
}
