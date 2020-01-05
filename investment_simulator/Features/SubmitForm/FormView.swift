import UIKit
import RxSwift
import RxCocoa

class FormView: UIViewController, UITextFieldDelegate, CustomizableByClosure {
  private let model = FormViewModel()
  private let disposeBag = DisposeBag()
  private let valueAmountForm = FormViewUIContent.valueAmountForm()
  private let cdiPercentForm = FormViewUIContent.CDIPercentForm()
  private let dateForm = FormViewUIContent.dateForm()
  private let submitButton = FormViewUIContent.submitButton()
  private let errorLabel = FormViewUIContent.errorLabel()
  private let dateFieldModel = DateFieldModel()
  private let percentFieldModel = PercentFieldModel()
  private let amountFieldModel = AmountFieldModel()
  private let scrollView = UIScrollView()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = Colors.whiteColor
    addUIComponents()
    addGesture()
    setupScrollConstraints()
    setupStackConstraints()
    setTextFieldModels()
    bindToModel()
  }

  lazy var stack = customInit(UIStackView()) { stack in
    stack.axis = .vertical
    stack.spacing = Dimens.spacing20
  }

  lazy var spacer = customInit(UIView()) { spacer in
    spacer.backgroundColor = .clear
    spacer.size(height: Dimens.size20)
  }

  private func bindToModel() {
    _ = valueAmountForm.getTextField().rx.text.orEmpty.bind(to: model.valueAmountText)
    _ = cdiPercentForm.getTextField().rx.text.orEmpty.bind(to: model.cdiPercentText)
    _ = dateForm.getTextField().rx.text.orEmpty.bind(to: model.dateText)
    _ = model.errorMessage.bind(to: errorLabel.rx.text)
    _ = model.errorLabelHidden.bind(to: errorLabel.rx.isHidden)
    _ = submitButton.rx.tap.bind { [weak self] in self?.model.buttonAction }.disposed(by: disposeBag)
  }

  private func addGesture() {
    let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }

  private func setTextFieldModels() {
    dateForm.getTextField().delegate = dateFieldModel
    valueAmountForm.getTextField().delegate = amountFieldModel
    cdiPercentForm.getTextField().delegate = percentFieldModel
  }

  private func addUIComponents() {
    view.addSubview(scrollView)
    scrollView.addSubview(stack)
    stack.addArrangedSubviewArray([valueAmountForm.build(),
                                   dateForm.build(),
                                   cdiPercentForm.build(),
                                   spacer,
                                   submitButton,
                                   errorLabel])
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
