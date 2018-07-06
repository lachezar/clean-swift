import Foundation

public protocol Interface: AnyObject {
  associatedtype Router
  associatedtype Interactor

  var router: Router { get }
  var interactor: Interactor { get }

  init(router: Router, interactor: Interactor)
}
