import UIKit
import Quick
import Nimble

@testable import investment_simulator

class DateTest: QuickSpec {
  override func spec() {
    super.spec()

    describe("#absoluteValueFrom") {
      context("get absolute value from date string") {

        let subject = Date("2020-12-30")!.timeIntervalSince1970
        let expected = Double(1609297200)

        it("check values") {
          expect(subject).to(equal(expected))
        }
      }
    }
  }
}
