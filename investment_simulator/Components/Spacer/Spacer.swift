import UIKit

struct Spacer: CustomizableByClosure {
  static func build(height: CGFloat) -> UIView {
    let spacer = UIView()
    spacer.backgroundColor = .clear
    spacer.size(height: height)
    return spacer
  }
}
