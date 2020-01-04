import RxCocoa
import RxSwift

class FormViewModel {
  var valueAmountText = BehaviorRelay<String>(value: "")
  var cdiPercentText = BehaviorRelay<String>(value: "")
  var dateText = BehaviorRelay<String>(value: "")
  var errorMessage = BehaviorRelay<String>(value: "")
  var errorLabelHidden = BehaviorRelay<Bool>(value: true)

  var buttonAction: Void {
    verifyRequest()
  }

  private func verifyRequest() {
    if hasEmptyValues() {
      setEmptyValueError()
      return
    }
    hiddesErrorLabel()
    fetchRequest()
  }

  private func hasEmptyValues() -> Bool {
    return [valueAmountText.value, cdiPercentText.value, dateText.value].contains { $0 == "" }
  }

  private func fetchRequest() {
    print("connect!!")
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
