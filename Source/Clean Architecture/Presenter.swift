import UIKit

public protocol Presenter: AnyObject {
  associatedtype Interface: UIViewController

  var interface: Interface! { get set }
}
