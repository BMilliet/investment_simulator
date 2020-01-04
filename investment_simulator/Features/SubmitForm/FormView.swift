import UIKit

class FormView: UIViewController, CustomizableByClosure {
  private let valueAmountForm = FormViewUIContent.valueAmountForm()
  private let cdiPercentForm = FormViewUIContent.CDIPercentForm()
  private let dateForm = FormViewUIContent.dateForm()
  private let submitButton = FormViewUIContent.submitButton()
  private let scrollView = UIScrollView()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = Colors.whiteColor
    addUIComponents()
    setupScrollConstraints()
    setupStackConstraints()
  }

  lazy var stack = customInit(UIStackView()) { stack in
    stack.axis = .vertical
    stack.spacing = Dimens.spacing20
  }

  lazy var spacer = customInit(UIView()) { spacer in
    spacer.backgroundColor = .clear
    spacer.size(height: Dimens.size20)
  }

  private func addUIComponents() {
    view.addSubview(scrollView)
    scrollView.addSubview(stack)
    stack.addArrangedSubview(valueAmountForm)
    stack.addArrangedSubview(dateForm)
    stack.addArrangedSubview(cdiPercentForm)
    stack.addArrangedSubview(spacer)
    stack.addArrangedSubview(submitButton)
  }

  private func setupScrollConstraints() {
    scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                      leading: view.safeAreaLayoutGuide.leadingAnchor,
                      bottom: view.safeAreaLayoutGuide.bottomAnchor,
                      trailing: view.safeAreaLayoutGuide.trailingAnchor)
  }

  private func setupStackConstraints() {
    stack.anchor(top: scrollView.topAnchor,
                 leading: scrollView.leadingAnchor,
                 bottom: scrollView.bottomAnchor,
                 trailing: scrollView.trailingAnchor,
                 padding: UIEdgeInsets(top: Dimens.spacing20,
                                       left: Dimens.spacing16,
                                       bottom: -Dimens.spacing20,
                                       right: -Dimens.spacing16))
  }
}
