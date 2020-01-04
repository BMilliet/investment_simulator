import RxCocoa
import RxSwift

class FormViewModel {
  var valueAmountText = BehaviorRelay<String>(value: "")
  var cdiPercentText = BehaviorRelay<String>(value: "")
  var dateText = BehaviorRelay<String>(value: "")

  var buttonAction: Void {
    print("some action!")
  }
}
