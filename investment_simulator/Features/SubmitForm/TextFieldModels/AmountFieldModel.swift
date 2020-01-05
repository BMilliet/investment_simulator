import UIKit

class AmountFieldModel: UIViewController, UITextFieldDelegate {
  private let formatter = MaskFormatter()

  func textField(_ textField: UITextField,
                 shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {
    guard let text = textField.text else { return false }
    textField.text = formatter.amountMask(text, string)
    return false
  }
}
