import UIKit

class ResultsViewRedemptionUIContent: CustomizableByClosure {
  private let title1: String = AppStrings.redemptionDate
  private let title2: String = AppStrings.calendarDays
  private let title3: String = AppStrings.monthlyIncome
  private let title4: String = AppStrings.InvestmentCDIPercentage
  private let title5: String = AppStrings.annualProfitability
  private let title6: String = AppStrings.profitabilityInThePeriod
  private let titleValue = TitleValue()

  var amountValue: String = "27/05/2020"

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
    stack.addArrangedSubviewArray([titleValue.build(titleValue: title1, valueAmount: amountValue),
                                   titleValue.build(titleValue: title2, valueAmount: amountValue),
                                   titleValue.build(titleValue: title3, valueAmount: amountValue),
                                   titleValue.build(titleValue: title4, valueAmount: amountValue),
                                   titleValue.build(titleValue: title5, valueAmount: amountValue),
                                   titleValue.build(titleValue: title5, valueAmount: amountValue)])
  }
}
