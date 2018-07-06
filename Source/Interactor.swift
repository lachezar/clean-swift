import Foundation

public protocol Interactor: AnyObject {
  associatedtype Presenter

  var presenter: Presenter { get }

  init(presenter: Presenter)
}
