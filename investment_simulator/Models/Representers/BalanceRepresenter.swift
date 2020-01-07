struct BalanceRepresenter {
  private let investedAmount: String // front
  private let grossAmount: Double //
  private let rateProfit: Double //
  private let taxesAmount: Double // juntos
  private let taxesRate: Double // juntos
  private let netAmount: Double //

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
    return AppStrings.currency + " " + investedAmount.replacingOccurrences(of: ".", with: ",")
  }

  func getGrossAmount() -> String {
    //return AppStrings.currency + " " + grossAmount.replacingOccurrences(of: ".", with: ",")
    return ""
  }

  func getRateProfit() -> String {
    //return AppStrings.currency + " " + rateProfit.replacingOccurrences(of: ".", with: ",")
    return ""
  }

  func getIRValues() -> String {
    //return AppStrings.currency + " " + taxesAmount.replacingOccurrences(of: ".", with: ",") + "(\(taxesRate + "%"))"
    return ""
  }

  func getNetAmount() -> String {
   // return AppStrings.currency + " " + netAmount.replacingOccurrences(of: ".", with: ",")
    return ""
  }
}
