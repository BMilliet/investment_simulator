import UIKit

class FormTextField: CustomizableByClosure {
  private var content = FormTextFieldUIContent()

  func build() -> UIView {
    setupConstraints()
    return container
  }

  private lazy var container = customInit(UIView()) { container in
    container.addSubview(content.titleLabel)
    container.addSubview(content.textField)
    container.addSubview(content.bottonLine)
  }

  private func setupConstraints() {
    content.titleLabel.anchor(top: container.safeAreaLayoutGuide.topAnchor,
                              leading: container.safeAreaLayoutGuide.leadingAnchor,
                              trailing: container.safeAreaLayoutGuide.trailingAnchor,
                              padding: UIEdgeInsets(top: 6, left: 0, bottom: 0, right: 0))

    content.textField.anchor(top: content.titleLabel.safeAreaLayoutGuide.bottomAnchor,
                             leading: container.safeAreaLayoutGuide.leadingAnchor,
                             trailing: container.safeAreaLayoutGuide.trailingAnchor,
                             padding: UIEdgeInsets(top: 6, left: 0, bottom: 0, right: 0))

    content.bottonLine.anchor(top: content.textField.safeAreaLayoutGuide.bottomAnchor,
                              leading: container.safeAreaLayoutGuide.leadingAnchor,
                              bottom: container.safeAreaLayoutGuide.bottomAnchor,
                              trailing: container.safeAreaLayoutGuide.trailingAnchor,
                              padding: UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 0))
  }
}
