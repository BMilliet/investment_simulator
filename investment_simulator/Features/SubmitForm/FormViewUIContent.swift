import UIKit

struct FormViewUIContent {
  static func valueAmountForm() -> UIView {
    let formTextField = FormTextField(title: AppStrings.amountToApply,
                                      placeHolder: AppStrings.currency)
    return formTextField.build()
  }

  static func dateForm() -> UIView {
    let formTextField = FormTextField(title: AppStrings.dueDate,
                                      placeHolder: AppStrings.dateFormat)
    return formTextField.build()
  }

  static func CDIPercentForm() -> UIView {
    let formTextField = FormTextField(title: AppStrings.cdiPercent,
                                      placeHolder: AppStrings.percentHolder)
    return formTextField.build()
  }
}
