import UIKit

class ResultsViewHeaderUIContent: CustomizableByClosure {
  var amountValue: String = "R$ 1.088,69"
  private let profitValue: String = AppStrings.totalIncomeOf + "R$ 88,69"

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
    stack.spacing = Dimens.spacing10
    stack.addArrangedSubviewArray([titleLabel,
                                   amountLabel,
                                   totalProfitLabel])
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
    label.minimumScaleFactor = Dimens.minimumTextScale
    label.textColor = .black
  }

  private lazy var totalProfitLabel = customInit(UILabel()) { label in
    label.text = profitValue
    label.numberOfLines = 1
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: Dimens.fontSmall)
    label.adjustsFontSizeToFitWidth = true
    label.isAccessibilityElement = true
    label.accessibilityTraits = .staticText
    label.accessibilityLanguage = AppStrings.acceptedLanguage
    label.minimumScaleFactor = Dimens.minimumTextScale
    label.textColor = Colors.mediumLightColor
  }
}
