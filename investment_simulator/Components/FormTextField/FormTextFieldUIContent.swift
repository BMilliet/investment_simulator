import UIKit

struct FormTextFieldUIContent: CustomizableByClosure {
  lazy var titleLabel = customInit(UILabel()) { label in
    //label.emptyText()
    label.text = "qual a data de vencimento do investimento?*"
    label.numberOfLines = 1
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: Dimens.fontSmall)
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = Dimens.minimumTextScale
    label.textColor = Colors.mediumLightColor
  }

  lazy var textField = customInit(UITextField()) { textField in
    textField.borderStyle = .none
    textField.textAlignment = .center
    textField.textColor = Colors.mediumLightColor
    textField.attributedPlaceholder = NSAttributedString(string: "dia/mes/ano",
                                                         attributes: [
                                                          .foregroundColor: Colors.mediumLightColor,
                                                          .font: UIFont.systemFont(ofSize: Dimens.fontLarge)])
  }

  lazy var bottonLine = customInit(UIView()) { line in
    line.size(height: 1)
    line.backgroundColor = Colors.extraLightColor
  }
}
