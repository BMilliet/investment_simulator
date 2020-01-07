struct RedemptionRepresenter {
  private let maturityDate: String //
  private let maturityTotalDays: Int //
  private let monthlyGrossRateProfit: Double //
  private let investmentCDIPercentage: String // tela de traz
  private let annualGrossRateProfit: Double //
  private let rateProfit: Double //

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
}
