import UIKit
import Quick
import Nimble

@testable import investment_simulator

class BalanceRepresenterTest: QuickSpec {
  override func spec() {
    super.spec()

    let balance = BalanceRepresenter(investedAmount: "12050.0",
                                     grossAmount: 53173.61,
                                     rateProfit: 7.4414,
                                     taxesAmount: 6168.54,
                                     taxesRate: 15.0,
                                     netAmount: 47005.07)

    describe("test getters") {
      context("get values in UI format") {

        let investedAmount = "R$ 12.050,0"
        let grossAmount = "R$ 53.173,61"
        let rateProfit = "R$ 7,44"
        let taxes = "R$ 6.168,54(15,0%)"
        let netAmount = "R$ 47.005,07"

        it("check values") {
          expect(balance.getInvestedAmount()).to(equal(investedAmount))
          expect(balance.getGrossAmount()).to(equal(grossAmount))
          expect(balance.getRateProfit()).to(equal(rateProfit))
          expect(balance.getIRValues()).to(equal(taxes))
          expect(balance.getNetAmount()).to(equal(netAmount))
        }
      }
    }
  }
}
