import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene,
             willConnectTo session: UISceneSession,
             options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    let rootView = FormView()
    let rootNavigationController = UINavigationController(rootViewController: rootView)

    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    window?.rootViewController = rootNavigationController
    window?.makeKeyAndVisible()

    guard (scene as? UIWindowScene) != nil else { return }
  }
}
