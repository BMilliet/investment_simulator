struct RedemptionRepresenter {
  private let helper = ValueRepresentation()
  private let maturityDate: String
  private let maturityTotalDays: Int
  private let monthlyGrossRateProfit: Double
  private let investmentCDIPercentage: String
  private let annualGrossRateProfit: Double
  private let rateProfit: Double

  init(maturityDate: String,
       maturityTotalDays: Int,
       monthlyGrossRateProfit: Double,
       investmentCDIPercentage: String,
       annualGrossRateProfit: Double,
       rateProfit: Double) {
    self.maturityDate = maturityDate
    self.maturityTotalDays = maturityTotalDays
    self.monthlyGrossRateProfit = monthlyGrossRateProfit
    self.investmentCDIPercentage = investmentCDIPercentage
    self.annualGrossRateProfit = annualGrossRateProfit
    self.rateProfit = rateProfit
  }

  func getMaturityDate() -> String {
    return maturityDate
  }

  func getMaturityTotalDays() -> String {
    return String(maturityTotalDays)
  }

  func getMonthlyGrossRateProfit() -> String {
    return helper.percent(monthlyGrossRateProfit)
  }

  func getInvestmentCDIPercentage() -> String {
    guard let value = Double(investmentCDIPercentage) else { return AppStrings.genericError }
    return helper.percent(value)
  }

  func getAnnualGrossRateProfit() -> String {
    return helper.percent(annualGrossRateProfit)
  }

  func getRateProfit() -> String {
    return helper.percent(rateProfit)
  }
}
