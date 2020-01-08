import UIKit

class ResultsViewHeaderUIContent: CustomizableByClosure {
  var amountValue: String = ""
  var profitValue: String = ""

  lazy var container = customInit(UIView()) { view in
    view.size(height: Dimens.size150)
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
    stack.alignment = .center
    stack.spacing = Dimens.spacing10
    stack.addArrangedSubviewArray([titleLabel,
                                   amountLabel,
                                   totalProfit()])
  }

  private lazy var titleLabel = customInit(UILabel()) { label in
    label.text = AppStrings.simulationResult
    label.numberOfLines = 1
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: Dimens.fontSmall)
    label.adjustsFontSizeToFitWidth = true
    label.isAccessibilityElement = true
    label.accessibilityTraits = .staticText
    label.accessibilityLanguage = AppStrings.acceptedLanguage
    label.accessibilityHint = AppStrings.simulationResult
    label.accessibilityValue = AppStrings.simulationResult
    label.minimumScaleFactor = Dimens.minimumTextScale
    label.textColor = Colors.mediumLightColor
  }

  private lazy var amountLabel = customInit(UILabel()) { label in
    label.text = amountValue
    label.numberOfLines = 1
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: Dimens.fontExtraLarge)
    label.adjustsFontSizeToFitWidth = true
    label.isAccessibilityElement = true
    label.accessibilityTraits = .staticText
    label.accessibilityLanguage = AppStrings.acceptedLanguage
    label.accessibilityValue = amountValue
    label.minimumScaleFactor = Dimens.minimumTextScale
    label.textColor = .black
  }

  private lazy var totalProfitLabel = customInit(UILabel()) { label in
    label.text = AppStrings.totalIncomeOf
    label.numberOfLines = 1
    label.textAlignment = .right
    label.font = UIFont.systemFont(ofSize: Dimens.fontSmall)
    label.adjustsFontSizeToFitWidth = true
    label.isAccessibilityElement = true
    label.accessibilityTraits = .staticText
    label.accessibilityLanguage = AppStrings.acceptedLanguage
    label.accessibilityHint = AppStrings.totalIncomeOf
    label.accessibilityValue = AppStrings.totalIncomeOf
    label.minimumScaleFactor = Dimens.minimumTextScale
    label.textColor = Colors.mediumLightColor
  }

  private lazy var totalProfitValue = customInit(UILabel()) { label in
    label.text = " " + profitValue
    label.numberOfLines = 1
    label.textAlignment = .left
    label.font = UIFont.systemFont(ofSize: Dimens.fontSmall)
    label.adjustsFontSizeToFitWidth = true
    label.isAccessibilityElement = true
    label.accessibilityTraits = .staticText
    label.accessibilityLanguage = AppStrings.acceptedLanguage
    label.accessibilityValue = profitValue
    label.minimumScaleFactor = Dimens.minimumTextScale
    label.textColor = Colors.primaryColor
  }

  private func totalProfit() -> UIView {
    let container = UIView()
    let title = totalProfitLabel
    let value = totalProfitValue
    container.addSubview(totalProfitLabel)
    container.addSubview(totalProfitValue)
    title.anchor(top: container.topAnchor,
                 leading: container.leadingAnchor,
                 bottom: container.bottomAnchor)

    value.anchor(top: container.topAnchor,
                 leading: totalProfitLabel.trailingAnchor,
                 bottom: container.bottomAnchor,
                 trailing: container.trailingAnchor)
    return container
  }
}
