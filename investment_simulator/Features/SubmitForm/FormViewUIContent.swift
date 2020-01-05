import UIKit

struct FormViewUIContent {
  static func valueAmountForm() -> FormTextField {
    let formTextField = FormTextField(title: AppStrings.amountToApply,
                                      placeHolder: AppStrings.currency)
    return formTextField
  }

  static func dateForm() -> FormTextField {
    let formTextField = FormTextField(title: AppStrings.dueDate,
                                      placeHolder: AppStrings.dateFormat)
    return formTextField
  }

  static func CDIPercentForm() -> FormTextField {
    let formTextField = FormTextField(title: AppStrings.cdiPercent,
                                      placeHolder: AppStrings.percentHolder)
    return formTextField
  }

  static func submitButton() -> UIButton {
    return CustomButton().build(title: AppStrings.simulate)
  }

  static func errorLabel() -> UILabel {
    return ErrorLabel().build()
  }
}
