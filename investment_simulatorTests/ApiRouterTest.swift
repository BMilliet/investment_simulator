import UIKit
import Quick
import Nimble

@testable import investment_simulator

class ApiRouterTest: QuickSpec {
  override func spec() {
    super.spec()

    let apiRouter = ApiRouter()

    describe("#getSimulationEndPoint") {
      context("build simulation endPoint") {
        let expected = "https://api-simulator-calc.easynvest.com.br/calculator/simulate?investedAmount=32323.0&index=CDI&rate=100.0&isTaxFree=false&maturityDate=2023-03-03"

        let subject = apiRouter.getSimulationEndPoint(investedAmountValue: "32323.0", rateValue: "100.0", maturityDateValue: "2023-03-03")!.absoluteString

        it("expected endpoint") {
          expect(subject).to(equal(expected))
        }
      }
    }
  }
}
