import UIKit

extension UIView {
  func anchor(top: NSLayoutYAxisAnchor? = nil,
              leading: NSLayoutXAxisAnchor? = nil,
              bottom: NSLayoutYAxisAnchor? = nil,
              trailing: NSLayoutXAxisAnchor? = nil,
              padding: UIEdgeInsets = .zero) {
    translatesAutoresizingMaskIntoConstraints = false

    if let top = top { topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true }
    if let bottom = bottom { bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true }
    if let leading = leading { leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true }
    if let trailing = trailing { trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true }
  }

  func size(height: CGFloat? = nil, width: CGFloat? = nil) {
    if let height = height { heightAnchor.constraint(equalToConstant: height).isActive = true }
    if let width = width { widthAnchor.constraint(equalToConstant: width).isActive = true }
  }
}
