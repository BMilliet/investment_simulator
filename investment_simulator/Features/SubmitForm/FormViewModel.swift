import RxCocoa
import RxSwift

class FormViewModel: RepresenterAssembler {
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
    if !validator.isValidAmount(valueAmountText.value) { setError(AppStrings.invalidAmout); return }
    if !validator.isValidPercentage(cdiPercentText.value) { setError(AppStrings.invalidCDI); return }
    if !validator.isValidDate(date: dateText.value,
                              todayDate: "08/01/2020") { setError(AppStrings.invalidDate); return }
    hiddesErrorLabel()
  }

  private func onSuccess(_ simulation: Simulation) {
    let redemption = self.redemption(from: simulation, cdi: cdiPercentText.value)
    let balance = self.balance(from: simulation, amount: valueAmountText.value)
    navigate(redemption, balance)
  }

  private func onError(_ error: Error) {
    setError(AppStrings.genericError)
  }

  private func navigate(_ redemption: RedemptionRepresenter, _ balance: BalanceRepresenter) {
    guard let rootNavigation = UIApplication.getRootNavigationController() else { return }
    rootNavigation.pushViewController(ResultsView(), animated: true)
  }
}
