protocol RepresenterAssembler {
  func redemption(from simulation: Simulation, cdi: String) -> RedemptionRepresenter
  func balance(from simulation: Simulation, amount: String) -> BalanceRepresenter
}

extension RepresenterAssembler {
  func redemption(from simulation: Simulation, cdi: String) -> RedemptionRepresenter {
    return RedemptionRepresenter(maturityDate: simulation.investmentParameter.maturityDate,
                                           maturityTotalDays: simulation.investmentParameter.maturityTotalDays,
                                           monthlyGrossRateProfit: simulation.monthlyGrossRateProfit,
                                           investmentCDIPercentage: cdi,
                                           annualGrossRateProfit: simulation.annualGrossRateProfit,
                                           rateProfit: simulation.rateProfit)
  }

  func balance(from simulation: Simulation, amount: String) -> BalanceRepresenter {
    return BalanceRepresenter(investedAmount: amount,
                              grossAmount: simulation.grossAmount,
                              rateProfit: simulation.rateProfit,
                              taxesAmount: simulation.taxesAmount,
                              taxesRate: simulation.taxesRate,
                              netAmount: simulation.netAmount)
  }
}
