import UIKit

struct ErrorLabel {
  func build() -> UILabel {
    let label = UILabel()
    label.numberOfLines = 1
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: Dimens.fontSmall)
    label.adjustsFontSizeToFitWidth = true
    label.isAccessibilityElement = true
    label.accessibilityTraits = .updatesFrequently
    label.accessibilityLanguage = AppStrings.acceptedLanguage
    label.accessibilityHint = label.text
    label.accessibilityLabel = label.text
    label.accessibilityValue = label.text
    label.minimumScaleFactor = Dimens.minimumTextScale
    label.textColor = Colors.errorColor
    return label
  }
}
