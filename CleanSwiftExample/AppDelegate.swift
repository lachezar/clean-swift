import UIKit
import CleanSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    let container = ComponentsContainer()
    let vc = container.testScreenComponent()
    let nVC = UINavigationController(rootViewController: vc)

    window?.rootViewController = nVC
    window?.makeKeyAndVisible()

    return true
  }
}
