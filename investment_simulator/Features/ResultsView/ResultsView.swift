import UIKit

class ResultsView: UIViewController, CustomizableByClosure {
  private let submitButton = CustomButton.build(title: AppStrings.simulateAgain)
  private let header = ResultsViewHeaderUIContent()
  private let balance = ResultsViewBalanceUIContent()
  private let redemption = ResultsViewRedemptionUIContent()
  private let scrollView = UIScrollView()

  override func viewDidLoad() {
    super.viewDidLoad()
    setBackgroundColors()
    addUIComponents()
    setupScrollConstraints()
    setupStackConstraints()
    setupButton()
  }

  lazy var stack = customInit(UIStackView()) { stack in
    stack.axis = .vertical
    stack.alignment = .center
    stack.spacing = Dimens.spacing20
  }

  private func setBackgroundColors() {
    view.backgroundColor = Colors.whiteColor
  }

  private func addUIComponents() {
    view.addSubview(scrollView)
    scrollView.addSubview(stack)
    stack.addArrangedSubviewArray([Spacer.build(height: Dimens.size20),
                                   header.container,
                                   balance.container,
                                   redemption.container,
                                   submitButton])
  }

  private func setupScrollConstraints() {
    scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                      leading: view.safeAreaLayoutGuide.leadingAnchor,
                      bottom: view.safeAreaLayoutGuide.bottomAnchor,
                      trailing: view.safeAreaLayoutGuide.trailingAnchor)
  }

  private func setupStackConstraints() {
    stack.isLayoutMarginsRelativeArrangement = true
    stack.anchor(top: scrollView.topAnchor,
                 leading: scrollView.leadingAnchor,
                 bottom: scrollView.bottomAnchor,
                 trailing: scrollView.trailingAnchor)
    stack.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
  }

  private func setupButton() {
    submitButton.size(width: view.frame.width - Dimens.spacing32)
  }
}
