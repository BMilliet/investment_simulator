import UIKit
import RxSwift

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .cyan

    let disposeBag = DisposeBag()

    guard let url = URL(string: "https://api-simulator-calc.easynvest.com.br/calculator/simulate?investedAmount=32323.0 &index=CDI&rate=100&isTaxFree=false&maturityDate=2023-03-03") else {

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
