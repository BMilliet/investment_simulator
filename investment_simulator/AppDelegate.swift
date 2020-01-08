import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let rootView = FormView()
    let rootNavigationController = UINavigationController(rootViewController: rootView)
    rootNavigationController.navigationBar.isHidden = true

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = rootNavigationController
    window?.makeKeyAndVisible()

    return true
  }

  func application(_ application: UIApplication,
                   supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    return UIInterfaceOrientationMask.portrait
  }
}
