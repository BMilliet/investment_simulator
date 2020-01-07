import Foundation
import UIKit

struct ApiRouter {
  private let baseUrl = "https://api-simulator-calc.easynvest.com.br"
  private let calculateOption = "/calculator"
  private let simulationOption = "/simulate"
  private let investedAmount = "investedAmount"
  private let index = "index"
  private let cdi = "CDI"
  private let rate = "rate"
  private let isTaxFree = "isTaxFree"
  private let maturityDate = "maturityDate"

  func getSimulationEndPoint(investedAmountValue: String,
                             rateValue: String,
                             maturityDateValue: String) -> URL? {
    return buildParams(
      URL(string: buildPath([baseUrl, calculateOption, simulationOption])),
      investedAmountValue: investedAmountValue,
      rateValue: rateValue,
      maturityDateValue: maturityDateValue)
  }

  private func buildParams(_ base: URL?,
                           investedAmountValue: String,
                           rateValue: String,
                           maturityDateValue: String) -> URL? {
    return base?.appending([URLQueryItem(name: investedAmount, value: investedAmountValue),
                            URLQueryItem(name: index, value: cdi),
                            URLQueryItem(name: rate, value: rateValue),
                            URLQueryItem(name: isTaxFree, value: "false"),
                            URLQueryItem(name: maturityDate, value: maturityDateValue)])
  }

  private func buildPath(_ array: [String]) -> String {
    return array.joined()
  }
}
