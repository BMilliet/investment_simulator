import UIKit
import Quick
import Nimble

@testable import investment_simulator

class JsonDecoderTest: QuickSpec {
  override func spec() {
    super.spec()

    let jsonDecoder = JsonDecoder()
    let mocks = JsonMocks()
    let helper = CompareHelper()

    describe("#decodeFromJson") {
      context("decode json") {
        let simulation = jsonDecoder.decodeFromJson(Simulation.self, mocks.simulation)

        it("check values") {
          expect(helper.isSimulation(simulation)).to(beTrue())
        }
      }
    }
  }
}
