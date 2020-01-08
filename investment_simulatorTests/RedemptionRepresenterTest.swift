import UIKit
import Quick
import Nimble

@testable import investment_simulator

class RedemptionRepresenterTest: QuickSpec {
  override func spec() {
    super.spec()

    let redemption = RedemptionRepresenter(maturityDate: "2040-01-09T00:00:00",
                                           maturityTotalDays: 7306,
                                           monthlyGrossRateProfit: 0.6,
                                           investmentCDIPercentage: "100",
                                           annualGrossRateProfit: 341.27,
                                           rateProfit: 7.4414)

    describe("test getters") {
      context("get values in UI format") {
        let maturityDate = "09/01/2040"
        let maturityTotalDays = "7306"
        let monthlyGrossRateProfit = "0,6%"
        let investmentCDIPercentage = "100,0%"
        let annualGrossRateProfit = "341,27%"
        let rateProfit = "7,44%"

        it("check values") {
          expect(redemption.getMaturityDate()).to(equal(maturityDate))
          expect(redemption.getMaturityTotalDays()).to(equal(maturityTotalDays))
          expect(redemption.getMonthlyGrossRateProfit()).to(equal(monthlyGrossRateProfit))
          expect(redemption.getInvestmentCDIPercentage()).to(equal(investmentCDIPercentage))
          expect(redemption.getAnnualGrossRateProfit()).to(equal(annualGrossRateProfit))
          expect(redemption.getRateProfit()).to(equal(rateProfit))
        }
      }
    }
  }
}
