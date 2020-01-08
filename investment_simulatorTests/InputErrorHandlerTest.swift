import UIKit
import Quick
import Nimble

@testable import investment_simulator

class InputErrorHandlerTest: QuickSpec {
  override func spec() {
    super.spec()

    let handler = InputErrorHandler()
    let validAmount = "1200.50"
    let validPercent = "100"
    let validDate = "20/12/2020"

    describe("#hasError") {
      context("check input errors") {

        var noError = ""
        let validInputs = handler.hasError(validAmount,
                                           validPercent,
                                           validDate) { error in noError = error}

        var amountError1 = ""
        let invalidInputs1 = handler.hasError("1200.50.2",
                                              validPercent,
                                              validDate) { error in amountError1 = error}

        var amountError2 = ""
        let invalidInputs2 = handler.hasError("value",
                                              validPercent,
                                              validDate) { error in amountError2 = error}

        var percentError1 = ""
        let invalidInputs3 = handler.hasError(validAmount,
                                              "1000",
                                              validDate) { error in percentError1 = error}

        var percentError2 = ""
        let invalidInputs4 = handler.hasError(validAmount,
                                              "invalid",
                                              validDate) { error in percentError2 = error}

        var dateError1 = ""
        let invalidInputs5 = handler.hasError(validAmount,
                                              validPercent,
                                              "40/12/2020") { error in dateError1 = error}

        var dateError2 = ""
        let invalidInputs6 = handler.hasError(validAmount,
                                              validPercent,
                                              "00/12/2020") { error in dateError2 = error}

        var dateError3 = ""
        let invalidInputs7 = handler.hasError(validAmount,
                                              validPercent,
                                              "10/00/2020") { error in dateError3 = error}

        var dateError4 = ""
        let invalidInputs8 = handler.hasError(validAmount,
                                              validPercent,
                                              "10/12/202") { error in dateError4 = error}

        it("check values") {
          expect(validInputs).to(beFalse())
          expect(noError).to(equal(""))
          expect(invalidInputs1).to(beTrue())
          expect(amountError1).to(equal(AppStrings.invalidAmout))
          expect(invalidInputs2).to(beTrue())
          expect(amountError2).to(equal(AppStrings.invalidAmout))
          expect(invalidInputs3).to(beTrue())
          expect(percentError1).to(equal(AppStrings.invalidCDI))
          expect(invalidInputs4).to(beTrue())
          expect(percentError2).to(equal(AppStrings.invalidCDI))
          expect(invalidInputs5).to(beTrue())
          expect(dateError1).to(equal(AppStrings.invalidDate))
          expect(invalidInputs6).to(beTrue())
          expect(dateError2).to(equal(AppStrings.invalidDate))
          expect(invalidInputs7).to(beTrue())
          expect(dateError3).to(equal(AppStrings.invalidDate))
          expect(invalidInputs8).to(beTrue())
          expect(dateError4).to(equal(AppStrings.invalidDate))
        }
      }
    }
  }
}
