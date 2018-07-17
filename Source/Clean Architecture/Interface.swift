import Foundation

public protocol Interface: AnyObject {
  associatedtype RouterType: Router
  associatedtype InteractorType: Interactor

  var router: RouterType { get }
  var interactor: InteractorType { get }
}
