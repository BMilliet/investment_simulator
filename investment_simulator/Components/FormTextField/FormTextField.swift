import UIKit

class FormTextField: CustomizableByClosure {
  private var content = FormTextFieldUIContent()

  init(title: String, placeHolder: String) {
    content.title = title
    content.placeHolder = placeHolder
  }

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
                              padding: UIEdgeInsets(top: Dimens.spacing6,
                                                    left: Dimens.zero,
                                                    bottom: Dimens.zero,
                                                    right: Dimens.zero))

    content.textField.anchor(top: content.titleLabel.safeAreaLayoutGuide.bottomAnchor,
                             leading: container.safeAreaLayoutGuide.leadingAnchor,
                             trailing: container.safeAreaLayoutGuide.trailingAnchor,
                             padding: UIEdgeInsets(top: Dimens.spacing10,
                                                   left: Dimens.zero,
                                                   bottom: Dimens.zero,
                                                   right: Dimens.zero))

    content.bottonLine.anchor(top: content.textField.safeAreaLayoutGuide.bottomAnchor,
                              leading: container.safeAreaLayoutGuide.leadingAnchor,
                              bottom: container.safeAreaLayoutGuide.bottomAnchor,
                              trailing: container.safeAreaLayoutGuide.trailingAnchor,
                              padding: UIEdgeInsets(top: Dimens.spacing2,
                                                    left: Dimens.zero,
                                                    bottom: Dimens.zero,
                                                    right: Dimens.zero))
  }
}
