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

    describe("#convertDateToBrazilianFormat") {
      context("convert to brazilian date format") {

        let subject = "2040-01-09"
        let expected = "09/01/2040"

        it("check values") {
          expect(subject.convertDateToBrazilianFormat()).to(equal(expected))
        }
      }
    }

    describe("#separate") {
      context("separete string by value") {

        let subject = "1002000"
        let expected = "100.200.0"

        it("check values") {
          expect(subject.separate(every: 3, with: ".")).to(equal(expected))
        }
      }
    }
  }
}
