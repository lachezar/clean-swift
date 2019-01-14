import UIKit
import CleanSwift
import PinLayout

final class ExampleSizingHeader: UITableViewHeaderFooterView, ComponentTemplate {

  struct Model: ElementModel {
    let text: String
  }

  
  // MARK: - Properties

  let height: CGFloat = 0
  var component: ExampleBoxVC?


  // MARK: - Initialization

  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  // MARK: - ElementTemplate

  func configure(model: ElementModel, path: IndexPath) {
    guard let model = model as? Model else {
      return }

    component = UIElement.exampleBox
    component?.set(text: model.text)
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
