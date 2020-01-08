import Foundation

struct JsonMocks {

  let simulation = """
  {
      "investmentParameter": {
          "investedAmount": 12050.0,
          "yearlyInterestRate": 6.4277,
          "maturityTotalDays": 1,
          "maturityBusinessDays": 0,
          "maturityDate": "2020-01-09T00:00:00",
          "rate": 100.0,
          "isTaxFree": false
      },
      "grossAmount": 12050.0,
      "taxesAmount": 0.0,
      "netAmount": 12050.0,
      "grossAmountProfit": 0.0,
      "netAmountProfit": 0.0,
      "annualGrossRateProfit": 0.0,
      "monthlyGrossRateProfit": 0.52,
      "dailyGrossRateProfit": 0.00024723569811802,
      "taxesRate": 22.5,
      "rateProfit": 6.4277,
      "annualNetRateProfit": 0.0
  }
  """.data(using: .utf8)!
}
