import UIKit

extension UIStackView {
  func addArrangedSubviewArray(_ list: [UIView]) {
    for view in list {
      self.addArrangedSubview(view)
    }
  }
}
