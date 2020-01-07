struct BalanceRepresenter {
  private let helper = ValueRepresentation()
  private let investedAmount: String
  private let grossAmount: Double
  private let rateProfit: Double
  private let taxesAmount: Double
  private let taxesRate: Double
  private let netAmount: Double

  init(investedAmount: String,
       grossAmount: Double,
       rateProfit: Double,
       taxesAmount: Double,
       taxesRate: Double,
       netAmount: Double) {
    self.investedAmount = investedAmount
    self.grossAmount = grossAmount
    self.rateProfit = rateProfit
    self.taxesAmount = taxesAmount
    self.taxesRate = taxesRate
    self.netAmount = netAmount
  }

  func getInvestedAmount() -> String {
    guard let value = Double(investedAmount) else { return AppStrings.genericError }
    return helper.currency(value)
  }

  func getGrossAmount() -> String {
    return helper.currency(grossAmount)
  }

  func getRateProfit() -> String {
    return helper.currency(rateProfit)
  }

  func getIRValues() -> String {
    return helper.mixedTaxesValue(taxesAmount, taxesRate)
  }

  func getNetAmount() -> String {
    return helper.currency(netAmount)
  }
}
