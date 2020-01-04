import UIKit
import Quick
import Nimble

@testable import investment_simulator

class URLTest: QuickSpec {
  override func spec() {
    super.spec()

    describe("#appending") {
      context("url appending params") {
        let mockUrl = URL(string: "mockUrl")!
        let queryItemMock1 = URLQueryItem(name: "name", value: "value")
        let queryItemMock2 = URLQueryItem(name: "name2", value: "value2")

        let subject1 = mockUrl.appending([queryItemMock1])
        let expected1 = URL(string: "mockUrl?name=value")!

        let subject2 = mockUrl.appending([queryItemMock1, queryItemMock2])
        let expected2 = URL(string: "mockUrl?name=value&name2=value2")!

        it("check values") {
          expect(subject1).to(equal(expected1))
          expect(subject2).to(equal(expected2))
        }
      }
    }
  }
}
