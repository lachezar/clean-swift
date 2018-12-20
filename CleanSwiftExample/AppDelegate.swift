import UIKit
import CleanSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    let vc = UIViewController()
    vc.view.backgroundColor = .red
    let nVC = UINavigationController(rootViewController: vc)

    window?.rootViewController = nVC
    window?.makeKeyAndVisible()

    return true
  }
}
