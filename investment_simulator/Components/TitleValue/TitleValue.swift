import UIKit

struct TitleValue {
  func build(titleValue: String, valueAmount: String) -> UIStackView {
    let stack = UIStackView()
    stack.axis  = .horizontal
    stack.spacing = 10
    stack.alignment = .fill
    stack.distribution = .equalSpacing
    stack.addArrangedSubviewArray([title(titleValue),
                                   value(valueAmount)])
    return stack
  }

  private func value(_ valueAmount: String) -> UILabel {
    let label = UILabel()
    label.text = valueAmount
    label.numberOfLines = 1
    label.textAlignment = .right
    label.font = UIFont.systemFont(ofSize: Dimens.fontSmall)
    label.adjustsFontSizeToFitWidth = true
    label.isAccessibilityElement = true
    label.accessibilityTraits = .staticText
    label.accessibilityLanguage = AppStrings.acceptedLanguage
    label.accessibilityHint = label.text
    label.accessibilityLabel = label.text
    label.accessibilityValue = label.text
    label.minimumScaleFactor = Dimens.minimumTextScale
    label.textColor = Colors.mediumLightColor
    return label
  }

  private func title(_ titleValue: String) -> UILabel {
    let label = UILabel()
    label.text = titleValue
    label.numberOfLines = 1
    label.textAlignment = .left
    label.font = UIFont.systemFont(ofSize: Dimens.fontSmall)
    label.adjustsFontSizeToFitWidth = true
    label.isAccessibilityElement = true
    label.accessibilityTraits = .staticText
    label.accessibilityLanguage = AppStrings.acceptedLanguage
    label.accessibilityHint = label.text
    label.accessibilityLabel = label.text
    label.accessibilityValue = label.text
    label.minimumScaleFactor = Dimens.minimumTextScale
    label.textColor = Colors.mediumLightColor
    label.size(width: 240)
    return label
  }
}
