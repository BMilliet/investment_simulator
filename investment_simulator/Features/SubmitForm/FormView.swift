import UIKit

class FormView: UIViewController, CustomizableByClosure {
  private let valueAmountForm = FormViewUIContent.valueAmountForm()
  private let cdiPercentForm = FormViewUIContent.CDIPercentForm()
  private let dateForm = FormViewUIContent.dateForm()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = Colors.whiteColor
    addUIComponents()
    setupScrollConstraints()
    setupStackConstraints()
  }

  let scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      return scrollView
  }()

  lazy var stack = customInit(UIStackView()) { stack in
    stack.axis = .vertical
    stack.spacing = 20
  }

  lazy var spacer = customInit(UIView()) { spacer in
    spacer.backgroundColor = .clear
    spacer.size(height: 20)
  }

  private func addUIComponents() {
    view.addSubview(scrollView)
    scrollView.addSubview(stack)
    stack.addArrangedSubview(spacer)
    stack.addArrangedSubview(valueAmountForm)
    stack.addArrangedSubview(dateForm)
    stack.addArrangedSubview(cdiPercentForm)
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
                 trailing: scrollView.trailingAnchor)
    stack.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
  }
}
