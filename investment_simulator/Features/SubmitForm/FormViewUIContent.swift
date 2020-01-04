import UIKit

struct FormViewUIContent {
  static func valueAmountForm() -> UIView {
    let formTextField = FormTextField(title: "Quanto voce gostaria de aplicar?", placeHolder: "R$")
    return formTextField.build()
  }

  static func dateForm() -> UIView {
    let formTextField = FormTextField(title: "Qual a data de vencimento do investimento?", placeHolder: "dia/mês/ano")
    return formTextField.build()
  }

  static func CDIPercentForm() -> UIView {
    let formTextField = FormTextField(title: "Qual o percentual do CDI do investimento?", placeHolder: "100%")
    return formTextField.build()
  }
}
