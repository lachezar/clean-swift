import UIKit
import CleanSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    let nVC = UINavigationController(rootViewController: Screen.menu)

    window?.rootViewController = nVC
    window?.makeKeyAndVisible()

    return true
  }
}
