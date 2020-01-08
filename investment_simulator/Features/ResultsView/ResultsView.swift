import UIKit

class ResultsView: UIViewController, CustomizableByClosure {
  private let submitButton = CustomButton.build(title: AppStrings.simulateAgain)
  private let header = ResultsViewHeaderUIContent()
  private let balance: ResultsViewBalanceUIContent
  private let redemption: ResultsViewRedemptionUIContent
  private let scrollView = UIScrollView()

  init(balance: ResultsViewBalanceUIContent,
       redemption: ResultsViewRedemptionUIContent,
       amount: String,
       profit: String) {
      self.balance = balance
      self.redemption = redemption
      header.amountValue = amount
      header.profitValue = profit
      super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError(AppStrings.initError)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setBackgroundColors()
    addUIComponents()
    setupScrollConstraints()
    setupStackConstraints()
    setupContentConstraints()
    setButtonAction()
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
                                   submitButton,
                                   Spacer.build(height: Dimens.size20)])
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

  private func setupContentConstraints() {
    balance.container.size(width: view.frame.width - Dimens.spacing16)
    redemption.container.size(width: view.frame.width - Dimens.spacing16)
    submitButton.size(width: view.frame.width - Dimens.spacing16)
  }

  private func setButtonAction() {
    submitButton.addTarget(self, action: #selector(popView), for: .touchUpInside)
  }

  @objc private func popView() {
    self.navigationController?.popViewController(animated: true)
  }
}
