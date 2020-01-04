import UIKit
import RxSwift
import RxCocoa

class FormView: UIViewController, CustomizableByClosure {
  private let model = FormViewModel()
  private let disposeBag = DisposeBag()
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
    bindToModel()
  }

  private func bindToModel() {
    _ = valueAmountForm.getTextField().rx.text.map { $0 ?? "" }.bind(to: model.valueAmountText)
    _ = cdiPercentForm.getTextField().rx.text.map { $0 ?? "" }.bind(to: model.cdiPercentText)
    _ = dateForm.getTextField().rx.text.map { $0 ?? "" }.bind(to: model.dateText)
    _ = submitButton.rx.tap.bind { [weak self] in self?.model.buttonAction }.disposed(by: disposeBag)
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
    stack.addArrangedSubview(valueAmountForm.build())
    stack.addArrangedSubview(dateForm.build())
    stack.addArrangedSubview(cdiPercentForm.build())
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
