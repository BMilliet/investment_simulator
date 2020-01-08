import UIKit

class ValueFieldModel: UIViewController, UITextFieldDelegate {
  private let formatter = MaskFormatter()

  func textField(_ textField: UITextField,
                 shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {
    guard let text = textField.text else { return false }
    textField.text = formatter.valueMask(text, string)
    return false
  }
}
