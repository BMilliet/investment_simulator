import UIKit
import Quick
import Nimble

@testable import investment_simulator

class ValueRepresentationTest: QuickSpec {
  override func spec() {
    super.spec()

    let representation = ValueRepresentation()

    describe("#currency") {
      context("convert value to R$ representation value") {

        let subject1 = representation.currency(306.748831)
        let expected1 = "R$ 306,75"

        let subject2 = representation.currency(1306.748831)
        let expected2 = "R$ 1.306,75"

        let subject3 = representation.currency(4981306.748831)
        let expected3 = "R$ 4.981.306,75"

        it("check values") {
          expect(subject1).to(equal(expected1))
          expect(subject2).to(equal(expected2))
          expect(subject3).to(equal(expected3))
        }
      }
    }

    describe("#mixedTaxesValue") {
      context("convert taxes amount and percentage to string representation") {

        let subject1 = representation.mixedTaxesValue(15.52453, 17.50)
        let expected1 = "R$ 15,52(17,5%)"

        let subject2 = representation.mixedTaxesValue(1235.52453, 123.3442)
        let expected2 = "R$ 1.235,52(123,34%)"

        it("check values") {
          expect(subject1).to(equal(expected1))
          expect(subject2).to(equal(expected2))
        }
      }
    }
  }
}
