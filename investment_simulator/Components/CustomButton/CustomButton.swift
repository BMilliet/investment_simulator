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
    return button
  }
}
