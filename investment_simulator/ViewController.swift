import UIKit
import RxSwift

class ViewController: UIViewController {

  private let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .cyan

    guard let url = ApiRouter().getSimulationEndPoint(investedAmountValue: 32323.0, rateValue: 100, maturityDateValue: "2023-03-03") else {
      print("url nil")
      return
    }

    Repository(disposeBag: disposeBag).doRequest(url, Simulation.self, success, fail)
  }

  func success(simulation: Simulation) {
    print(simulation)
  }

  func fail(error: Error) {
    print(error)
  }
}
