import UIKit

class ResultsViewBalanceUIContent: CustomizableByClosure {
  private let title1: String = AppStrings.initialValue
  private let title2: String = AppStrings.fullValue
  private let title3: String = AppStrings.profitValue
  private let title4: String = AppStrings.ironinvestment
  private let title5: String = AppStrings.netInvestmentValue
  private let titleValue = TitleValue()
  private let balance: BalanceRepresenter

  init(balance: BalanceRepresenter) {
    self.balance = balance
  }

  var amountValue: String = "R$ 1.088,69"

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

    let investedAmount = balance.getInvestedAmount()
    let grossAmount = balance.getGrossAmount()
    let rateProfit = balance.getRateProfit()
    let taxesValues = balance.getIRValues()
    let netAmount = balance.getNetAmount()

    stack.addArrangedSubviewArray([titleValue.build(titleValue: title1, valueAmount: investedAmount),
                                   titleValue.build(titleValue: title2, valueAmount: grossAmount),
                                   titleValue.build(titleValue: title3, valueAmount: rateProfit),
                                   titleValue.build(titleValue: title4, valueAmount: taxesValues),
                                   titleValue.build(titleValue: title5, valueAmount: netAmount)])
  }
}
