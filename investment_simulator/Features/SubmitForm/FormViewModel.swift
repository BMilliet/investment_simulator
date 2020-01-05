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
      setEmptyValueError() :
      validFormatAction()
  }

  private func validFormatAction() {
    hiddesErrorLabel()
    fetchRequest()
  }

  private func fetchRequest() {
    print(valueAmountText.value)
    print(cdiPercentText.value)
    print(dateText.value)
    //navigate()
  }

  private func hiddesErrorLabel() {
    errorMessage.accept("")
    errorLabelHidden.accept(true)
  }

  private func setEmptyValueError() {
    errorMessage.accept(AppStrings.emptyValuesError)
    errorLabelHidden.accept(false)
  }

  private func navigate() {
    guard let rootNavigation = UIApplication.getRootNavigationController() else { return }
    rootNavigation.pushViewController(ResultsView(), animated: true)
  }
}
