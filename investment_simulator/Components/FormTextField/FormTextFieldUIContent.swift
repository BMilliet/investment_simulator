import UIKit

struct FormTextFieldUIContent: CustomizableByClosure {
  var title: String = ""
  var placeHolder: String = ""

  lazy var titleLabel = customInit(UILabel()) { label in
    label.text = title
    label.numberOfLines = 1
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: Dimens.fontSmall)
    label.adjustsFontSizeToFitWidth = true
    label.isAccessibilityElement = true
    label.accessibilityTraits = .staticText
    label.accessibilityLanguage = AppStrings.acceptedLanguage
    label.minimumScaleFactor = Dimens.minimumTextScale
    label.textColor = Colors.mediumLightColor
  }

  lazy var textField = customInit(UITextField()) { textField in
    textField.borderStyle = .none
    textField.textAlignment = .center
    textField.textColor = Colors.mediumLightColor
    textField.keyboardType = .numberPad
    textField.isAccessibilityElement = true
    textField.accessibilityTraits = .selected
    textField.accessibilityLanguage = AppStrings.acceptedLanguage
    textField.attributedPlaceholder = NSAttributedString(string: placeHolder,
                                                         attributes: [
                                                          .foregroundColor: Colors.mediumLightColor,
                                                          .font: UIFont.systemFont(ofSize: Dimens.fontLarge)])
  }

  lazy var bottonLine = customInit(UIView()) { line in
    line.size(height: Dimens.size1)
    line.backgroundColor = Colors.extraLightColor
  }
}
