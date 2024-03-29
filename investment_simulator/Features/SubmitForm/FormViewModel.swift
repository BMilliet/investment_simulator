import RxCocoa
import RxSwift

class FormViewModel: RepresenterAssembler {
  var valueAmountText = BehaviorRelay<String>(value: "")
  var cdiPercentText = BehaviorRelay<String>(value: "")
  var dateText = BehaviorRelay<String>(value: "")
  var errorMessage = BehaviorRelay<String>(value: "")
  var errorLabelHidden = BehaviorRelay<Bool>(value: true)
  private let validator = Validator()
  private let errorHandler = InputErrorHandler()
  private let disposeBag = DisposeBag()

  var buttonAction: Void {
    validator.hasEmptyValues([valueAmountText.value,
                              cdiPercentText.value,
                              dateText.value]) ?
      setError(AppStrings.emptyValuesError) :
      validFormatAction()
  }

  private func validFormatAction() {
    hiddesErrorLabel()
    validateAndDoRequest()
  }

  private func validateAndDoRequest() {
    if !hasInputError() { fetchRequest() }
  }

  private func fetchRequest() {
    if let url = ApiRouter().getSimulationEndPoint(investedAmountValue: valueAmountText.value,
                                                   rateValue: cdiPercentText.value,
                                                   maturityDateValue: dateText.value.convertDateInputFormat()) {
      Repository(disposeBag: disposeBag).doRequest(url,
                                                   Simulation.self,
                                                   onSuccess, onError)
    }
  }

  private func hiddesErrorLabel() {
    errorMessage.accept("")
    errorLabelHidden.accept(true)
  }

  private func setError(_ description: String) {
    errorMessage.accept(description)
    errorLabelHidden.accept(false)
  }

  private func hasInputError() -> Bool {
    if errorHandler.hasError(valueAmountText.value,
                             cdiPercentText.value,
                             dateText.value,
                             setError(_:)) { return true }
    hiddesErrorLabel()
    return false
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
    let resultsView = ResultsView(balance: ResultsViewBalanceUIContent(balance: balance),
                                  redemption: ResultsViewRedemptionUIContent(redemption: redemption),
                                  amount: balance.getGrossAmount(),
                                  profit: redemption.getAnnualGrossRateProfit())
    rootNavigation.pushViewController(resultsView, animated: true)
  }
}
