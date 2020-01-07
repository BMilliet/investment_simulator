import UIKit

class ResultsViewRedemptionUIContent: CustomizableByClosure {
  private let title1: String = AppStrings.redemptionDate
  private let title2: String = AppStrings.calendarDays
  private let title3: String = AppStrings.monthlyIncome
  private let title4: String = AppStrings.InvestmentCDIPercentage
  private let title5: String = AppStrings.annualProfitability
  private let title6: String = AppStrings.profitabilityInThePeriod
  private let titleValue = TitleValue()
  private let redemption: RedemptionRepresenter

  init(redemption: RedemptionRepresenter) {
    self.redemption = redemption
  }

  lazy var container = customInit(UIView()) { view in
    view.size(height: Dimens.size240)
    view.addSubview(stack)
    stack.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                 leading: view.safeAreaLayoutGuide.leadingAnchor,
                 bottom: view.safeAreaLayoutGuide.bottomAnchor,
                 trailing: view.safeAreaLayoutGuide.trailingAnchor,
                 padding: UIEdgeInsets(top: Dimens.spacing20,
                                       left: Dimens.spacing16,
                                       bottom: -Dimens.spacing20,
                                       right: -Dimens.spacing16))
  }

  private lazy var stack = customInit(UIStackView()) { stack in
    stack.axis = .vertical
    stack.distribution = .fillEqually
    stack.spacing = Dimens.spacing10

    let maturityDate = redemption.getMaturityDate()
    let maturityTotalDays = redemption.getMaturityTotalDays()
    let monthlyGrossRateProfit = redemption.getMonthlyGrossRateProfit()
    let investmentCDIPercentage = redemption.getInvestmentCDIPercentage()
    let annualGrossRateProfit = redemption.getAnnualGrossRateProfit()
    let rateProfit = redemption.getRateProfit()

    stack.addArrangedSubviewArray([titleValue.build(titleValue: title1, valueAmount: maturityDate),
                                   titleValue.build(titleValue: title2, valueAmount: maturityTotalDays),
                                   titleValue.build(titleValue: title3, valueAmount: monthlyGrossRateProfit),
                                   titleValue.build(titleValue: title4, valueAmount: investmentCDIPercentage),
                                   titleValue.build(titleValue: title5, valueAmount: annualGrossRateProfit),
                                   titleValue.build(titleValue: title5, valueAmount: rateProfit)])
  }
}
