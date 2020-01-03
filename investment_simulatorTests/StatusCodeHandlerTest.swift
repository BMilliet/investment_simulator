import UIKit
import Quick
import Nimble

@testable import investment_simulator

class StatusCodeHandlerTest: QuickSpec {
  override func spec() {
    super.spec()

    let statusCodeHandler = StatusCodeHandler()
    let helper = CompareHelper()

    describe("#isInvalidStatusCode") {
      context("check if status code is valid") {
        it("check values") {
          expect(statusCodeHandler.isInvalidStatusCode(200)).to(beFalse())
          expect(statusCodeHandler.isInvalidStatusCode(299)).to(beFalse())
          expect(statusCodeHandler.isInvalidStatusCode(404)).to(beTrue())
          expect(statusCodeHandler.isInvalidStatusCode(500)).to(beTrue())
        }
      }
    }

    describe("#returnApiError") {
      context("check apiError for status code") {
        let expect1 = helper.isEqual(lhs: statusCodeHandler.returnApiError(for: 401), rhs: ApiError.unauthorized)
        let expect2 = helper.isEqual(lhs: statusCodeHandler.returnApiError(for: 403), rhs: ApiError.forbidden)
        let expect3 = helper.isEqual(lhs: statusCodeHandler.returnApiError(for: 404), rhs: ApiError.notFound)
        let expect4 = helper.isEqual(lhs: statusCodeHandler.returnApiError(for: 409), rhs: ApiError.conflict)
        let expect5 = helper.isEqual(lhs: statusCodeHandler.returnApiError(for: 500), rhs: ApiError.internalServerError)
        let expect6 = helper.isEqual(lhs: statusCodeHandler.returnApiError(for: 0), rhs: ApiError.unknown)

        it("check values") {
          expect(expect1).to(beTrue())
          expect(expect2).to(beTrue())
          expect(expect3).to(beTrue())
          expect(expect4).to(beTrue())
          expect(expect5).to(beTrue())
          expect(expect6).to(beTrue())
        }
      }
    }
  }
}
