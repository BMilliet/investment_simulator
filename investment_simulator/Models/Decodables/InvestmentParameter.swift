struct InvestmentParameter: Decodable {
  let investedAmount: Double
  let yearlyInterestRate: Double
  let maturityTotalDays: Int
  let maturityBusinessDays: Int
  let maturityDate: String
  let rate: Double
  let isTaxFree: Bool
}
