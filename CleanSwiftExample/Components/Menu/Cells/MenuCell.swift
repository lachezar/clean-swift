import UIKit
import CleanSwift
import PinLayout

final class MenuCell: UITableViewCell, ElementTemplate {

  struct Model: ElementModel {
    let title: String
  }

  
  // MARK: - Properties

  let height: CGFloat = 44


  // UI

  let titleLabel: UILabel = {
    let l = UILabel.init(frame: .zero)
    l.text = "Title Text"

    return l
  }()


  // MARK: - Initialization

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    selectionStyle = .none
    separatorInset = .zero

    contentView.addSubview(titleLabel)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  // MARK: - ElementTemplate

  func configure(model: ElementModel, path: IndexPath) {
    guard let model = model as? Model else {
      return }
    titleLabel.text = "\(path.row): \(model.title)"
  }


  // MARK: - Override

  override func layoutSubviews() {
    super.layoutSubviews()
    layout()
  }

  private func layout() {
    titleLabel.pin.horizontally(16).vCenter().sizeToFit(.width)
  }
}
