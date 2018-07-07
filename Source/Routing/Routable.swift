import UIKit

/// Custom Animations
/// conform Interface to UIViewControllerTransitioningDelegate and UINavigationControllerDelegate
/// For animations that are performed by UINavigationController override UINavigationControllerDelegate methods
public protocol RoutableDelegate: AnyObject {
  func moveTo<T>(route: T) where T: RouteProtocol
}

public protocol RouteProtocol {}

public protocol Routable: AnyObject {
  associatedtype Route: RouteProtocol

  var route: Route! { get set }

  func performRoute()
}
