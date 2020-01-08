import UIKit
import Quick
import Nimble

@testable import investment_simulator

class MaskFormatterTest: QuickSpec {
  override func spec() {
    super.spec()

    let mask = MaskFormatter()

    describe("#formatDateMask") {
      context("apply mask to input values") {
        let subject1 = mask.formatDateMask("1", "0")
        let expected1 = "10/"
        let subject2 = mask.formatDateMask(subject1, "1")
        let expected2 = "10/1"
        let subject3 = mask.formatDateMask(subject2, "0")
        let expected3 = "10/10/"
        let subject4 = mask.formatDateMask(subject3, "2")
        let expected4 = "10/10/2"
        let subject5 = mask.formatDateMask(subject4, "0")
        let expected5 = "10/10/20"
        let subject6 = mask.formatDateMask(subject5, "1")
        let expected6 = "10/10/201"
        let subject7 = mask.formatDateMask(subject6, "9")
        let expected7 = "10/10/2019"

        it("check values") {
          expect(subject1).to(equal(expected1))
          expect(subject2).to(equal(expected2))
          expect(subject3).to(equal(expected3))
          expect(subject4).to(equal(expected4))
          expect(subject5).to(equal(expected5))
          expect(subject6).to(equal(expected6))
          expect(subject7).to(equal(expected7))
        }
      }

      context("apply mask pass max size") {
        let subject = mask.formatDateMask("10/10/2019", "1")
        let expected = "10/10/2019"

        it("should not add new value") {
          expect(subject).to(equal(expected))
        }
      }
    }

    describe("#valueMask") {
      context("apply mask pass max size") {
        let digits_27 = "123456789123456789123456789"

        let subject = mask.valueMask(digits_27, "1")
        let expected = digits_27

        it("should not add new value") {
          expect(subject).to(equal(expected))
        }
      }
    }
  }
}
