import UIKit

extension UIApplication {
  static func getRootNavigationController() -> UINavigationController? {
    guard let first = self.shared.windows.first else { return nil }
    return first.rootViewController as? UINavigationController
  }
}
