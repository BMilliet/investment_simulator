import RxCocoa
import RxSwift

class FormViewModel {
  var valueAmountText = BehaviorRelay<String>(value: "")
  var cdiPercentText = BehaviorRelay<String>(value: "")
  var dateText = BehaviorRelay<String>(value: "")
  var errorMessage = BehaviorRelay<String>(value: "")
  var errorLabelHidden = BehaviorRelay<Bool>(value: true)
  private let validator = Validator()

  var buttonAction: Void {
    validator.hasEmptyValues([valueAmountText.value,
                              cdiPercentText.value,
                              dateText.value]) ?
      setError(AppStrings.emptyValuesError) :
      validFormatAction()
  }

  private func validFormatAction() {
    hiddesErrorLabel()
    fetchRequest()
  }

  private func fetchRequest() {
    checkForInputError()
    //navigate()
  }

  private func hiddesErrorLabel() {
    errorMessage.accept("")
    errorLabelHidden.accept(true)
  }

  private func setError(_ description: String) {
    errorMessage.accept(description)
    errorLabelHidden.accept(false)
  }

  private func checkForInputError() {
    if !validator.isValidAmount(valueAmountText.value) { setError("amount error"); return }
    if !validator.isValidPercentage(cdiPercentText.value) { setError("percent error"); return }
    if !validator.isValidDate(date: dateText.value,
                             todayDate: "05/01/2020") { setError("date error"); return }
    hiddesErrorLabel()
  }

  private func navigate() {
    guard let rootNavigation = UIApplication.getRootNavigationController() else { return }
    rootNavigation.pushViewController(ResultsView(), animated: true)
  }
}
