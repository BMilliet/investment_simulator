import UIKit

class ResultsViewBalanceUIContent: CustomizableByClosure {
  var title1: String = "Valor aplicado inicialmente"
  var title2: String = "Valor bruto do investimento"
  var title3: String = "Valor do rendimento"
  var title4: String = "IR sobre o investimento"
  var title5: String = "Valor líquido do investimento"

  var amountValue: String = "R$ 1.088,69"
  let titleValue = TitleValue()

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
                                   titleValue.build(titleValue: title5, valueAmount: amountValue)])
  }
}
