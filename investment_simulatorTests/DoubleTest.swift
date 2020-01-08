import UIKit
import Quick
import Nimble

@testable import investment_simulator

class DoubleTest: QuickSpec {
  override func spec() {
    super.spec()

    describe("#rounded") {
      context("round double") {

        let subjetc1 = 100.123
        let expected1 = 100.12

        let subjetc2 = 100.123
        let expected2 = 100.1

        let subjetc3 = 100.123
        let expected3 = 100.123

        it("compare values") {
          expect(subjetc1.rounded(toPlaces: 2)).to(equal(expected1))
          expect(subjetc2.rounded(toPlaces: 1)).to(equal(expected2))
          expect(subjetc3.rounded(toPlaces: 3)).to(equal(expected3))
        }
      }
    }
  }
}
