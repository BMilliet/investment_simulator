import RxCocoa
import RxSwift

class FormViewModel {
  var valueAmountText = BehaviorRelay<String>(value: "")
  var cdiPercentText = BehaviorRelay<String>(value: "")
  var dateText = BehaviorRelay<String>(value: "")
  var errorMessage = BehaviorRelay<String>(value: "")
  var errorLabelHidden = BehaviorRelay<Bool>(value: true)

  var buttonAction: Void {
    hasEmptyValues() ?
      setEmptyValueError() :
      validInputValueAction()
  }

  private func validInputValueAction() {
    hiddesErrorLabel()
    fetchRequest()
  }

  private func hasEmptyValues() -> Bool {
    return [valueAmountText.value,
            cdiPercentText.value,
            dateText.value].contains { $0 == "" }
  }

  private func fetchRequest() {
    print(valueAmountText.value)
    print(cdiPercentText.value)
    print(dateText.value)
  }

  private func hiddesErrorLabel() {
    errorMessage.accept("")
    errorLabelHidden.accept(true)
  }

  private func setEmptyValueError() {
    errorMessage.accept(AppStrings.emptyValuesError)
    errorLabelHidden.accept(false)
  }
}
