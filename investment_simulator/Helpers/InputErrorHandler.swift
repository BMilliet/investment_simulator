import Foundation

struct InputErrorHandler {
  private let validator = Validator()

    func hasError(_ valueAmountText: String,
                  _ cdiPercentText: String,
                  _ dateText: String,
                  _ completion: (String) -> Void) -> Bool {
    if !validator.isValidAmount(valueAmountText) {
      completion(AppStrings.invalidAmout)
      return true
    }

    if !validator.isValidPercentage(cdiPercentText) {
      completion(AppStrings.invalidCDI)
      return true
    }

    if !validator.isValidDate(date: dateText,
                              todayDate: "08/01/2020") {
      completion(AppStrings.invalidDate)
      return true
    }
    return false
  }
}
