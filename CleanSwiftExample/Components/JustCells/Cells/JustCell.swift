import UIKit
import CleanSwift
import PinLayout

final class JustCell: UITableViewCell, ComponentTemplate {
  
  struct Model: ElementModel {
    let text: String
  }
  

  // MARK: - Properties

  let height: CGFloat = 0
  var component: ExampleBoxVC?


  // MARK: - Initialization

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    selectionStyle = .none
    separatorInset = .zero
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  // MARK: - ElementTemplate

  func configure(model: ElementModel, path: IndexPath) {
    guard let model = model as? Model else {
      return }
    let component = UIElement.exampleBox
    component.set(text: "\(path.row): \(model.text)")

    self.component = component
  }

  // MARK: - Override

  override func layoutSubviews() {
    super.layoutSubviews()
    layout()
  }

  override func sizeThatFits(_ size: CGSize) -> CGSize {
    contentView.pin.width(size.width)

    layout()

    let height = component?.view.frame.maxY ?? 10
    return CGSize(width: contentView.frame.width, height: height)
  }

  private func layout() {
    component?.view.pin.all().sizeToFit(.width)
  }
}
