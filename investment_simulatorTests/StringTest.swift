import UIKit
import Quick
import Nimble

@testable import investment_simulator

class StringTest: QuickSpec {
  override func spec() {
    super.spec()

    describe("#convertDateInputFormat") {
      context("convert mask format to input value") {

        let subject = "05/01/2020"
        let expected = "2020-01-05"

        it("check values") {
          expect(subject.convertDateInputFormat()).to(equal(expected))
        }
      }
    }
  }
}
