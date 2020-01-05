import UIKit

struct CustomButton: CustomizableByClosure {
  func build(title: String) -> UIButton {
    let button = UIButton()
    button.setTitleColor(Colors.whiteColor, for: .normal)
    button.backgroundColor = Colors.primaryColor
    button.size(height: Dimens.size50)
    button.sizeToFit()
    button.layer.cornerRadius = Dimens.size25
    button.setTitle(title, for: .normal)
    button.isAccessibilityElement = true
    button.accessibilityTraits = .button
    button.accessibilityLanguage = AppStrings.acceptedLanguage
    button.accessibilityHint = title
    button.accessibilityLabel = title
    button.accessibilityValue = title
    return button
  }
}
