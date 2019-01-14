import UIKit
import PinLayout

extension ExampleBoxRouter {
  final class ContentView: UIView {
    // MARK: - Properties
    let textLabel: UILabel = {
      let l = UILabel(frame: .zero)
      l.text = ""
      l.font = UIFont.systemFont(ofSize: 16)
      l.textColor = .red
      l.numberOfLines = 0

      return l
    }()
    // MARK: - Initialization
    init() {
      super.init(frame: .zero)

      backgroundColor = .lightGray

      addSubview(textLabel)
    }
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }

    // MARK: - Layout
    // Use this for flexible sizes
     override func sizeThatFits(_ size: CGSize) -> CGSize {
       self.pin.width(size.width)

       return layout()
     }

    override func layoutSubviews() {
      super.layoutSubviews()
      layout()
    }

    // Use this for flexible sizes
    @discardableResult
    fileprivate func layout() -> CGSize {
      textLabel.pin.horizontally(16).top(8).sizeToFit(.width)

//      print("maxY: \(textLabel.frame.maxY)")
      return CGSize(width: frame.width, height: textLabel.frame.maxY + 8)
    }
  }
}
