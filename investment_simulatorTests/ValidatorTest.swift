import UIKit
import Quick
import Nimble

@testable import investment_simulator

class ValidatorTest: QuickSpec {
  override func spec() {
    super.spec()

    let validator = Validator()

    describe("#hasEmptyValues") {
      context("check for empty values in array") {

        let validList = ["value1", "value2", "value3"]
        let invalidList = ["value1", "value2", ""]

        it("compare values") {
          expect(validator.hasEmptyValues(validList)).to(beFalse())
          expect(validator.hasEmptyValues(invalidList)).to(beTrue())
        }
      }
    }

    describe("#isValidAmount") {
      context("check valid amout value") {

        let validAmount1 = "1234"
        let validAmount2 = "1234.5"
        let validAmount3 = "1234.52944"
        let invalidAmount1 = "12.34.5"
        let invalidAmount2 = "number"

        it("compare values") {
          expect(validator.isValidAmount(validAmount1)).to(beTrue())
          expect(validator.isValidAmount(validAmount2)).to(beTrue())
          expect(validator.isValidAmount(validAmount3)).to(beTrue())
          expect(validator.isValidAmount(invalidAmount1)).to(beFalse())
          expect(validator.isValidAmount(invalidAmount2)).to(beFalse())
        }
      }
    }

    describe("#isValidPercentage") {
      context("check valid percentage value") {

        let validPercentage1 = "100.0"
        let validPercentage2 = "95.10"
        let validPercentage3 = "80"
        let validPercentage4 = "99.9128891"
        let invalidPercentage1 = "1211"
        let invalidPercentage2 = "1200.20"
        let invalidPercentage3 = "number"

        it("compare values") {
          expect(validator.isValidPercentage(validPercentage1)).to(beTrue())
          expect(validator.isValidPercentage(validPercentage2)).to(beTrue())
          expect(validator.isValidPercentage(validPercentage3)).to(beTrue())
          expect(validator.isValidPercentage(validPercentage4)).to(beTrue())
          expect(validator.isValidPercentage(invalidPercentage1)).to(beFalse())
          expect(validator.isValidPercentage(invalidPercentage2)).to(beFalse())
          expect(validator.isValidPercentage(invalidPercentage3)).to(beFalse())
        }
      }
    }

    describe("#isValidDate") {
      context("check valid percentage value") {

        let mockCurrentDate = "05/01/2020"
        let validDate = "06/01/2020"
        let invalidDate1 = "04/01/2020"
        let invalidDate2 = "04/01/20"
        let invalidDate3 = "00/01/2020"
        let invalidDate4 = "06/00/2020"
        let invalidDate5 = "06/01/0000"
        let invalidDate6 = "06012020"
        let invalidDate7 = "060/120/20"
        let invalidDate8 = "date"

        it("compare values") {
          expect(validator.isValidDate(date: validDate, todayDate: mockCurrentDate)).to(beTrue())
          expect(validator.isValidDate(date: invalidDate1, todayDate: mockCurrentDate)).to(beFalse())
          expect(validator.isValidDate(date: invalidDate2, todayDate: mockCurrentDate)).to(beFalse())
          expect(validator.isValidDate(date: invalidDate3, todayDate: mockCurrentDate)).to(beFalse())
          expect(validator.isValidDate(date: invalidDate4, todayDate: mockCurrentDate)).to(beFalse())
          expect(validator.isValidDate(date: invalidDate5, todayDate: mockCurrentDate)).to(beFalse())
          expect(validator.isValidDate(date: invalidDate6, todayDate: mockCurrentDate)).to(beFalse())
          expect(validator.isValidDate(date: invalidDate7, todayDate: mockCurrentDate)).to(beFalse())
          expect(validator.isValidDate(date: invalidDate8, todayDate: mockCurrentDate)).to(beFalse())
        }
      }
    }
  }
}
