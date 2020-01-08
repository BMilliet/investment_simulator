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
  private let valueFieldModel = ValueFieldModel()
  private let scrollView = UIScrollView()

  override func viewDidLoad() {
    super.viewDidLoad()
    setBackgroundColors()
    addUIComponents()
    addGesture()
    setAccessibilityValues()
    setupScrollConstraints()
    setupStackConstraints()
    setupContentConstraints()
    setTextFieldModels()
    bindToModel()
  }

  lazy var stack = customInit(UIStackView()) { stack in
    stack.axis = .vertical
    stack.alignment = .center
    stack.spacing = Dimens.spacing20
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
    let tap = UITapGestureRecognizer(target: view,
                                     action: #selector(UIView.endEditing))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }

  private func setAccessibilityValues() {
    valueAmountForm.setAccessibility()
    cdiPercentForm.setAccessibility()
    dateForm.setAccessibility()
  }

  private func setTextFieldModels() {
    dateForm.getTextField().delegate = dateFieldModel
    valueAmountForm.getTextField().delegate = valueFieldModel
    cdiPercentForm.getTextField().delegate = valueFieldModel
  }

  private func addUIComponents() {
    view.addSubview(scrollView)
    scrollView.addSubview(stack)
    stack.addArrangedSubviewArray([Spacer.build(height: Dimens.size20),
                                   valueAmountForm.build(),
                                   dateForm.build(),
                                   cdiPercentForm.build(),
                                   Spacer.build(height: Dimens.size20),
                                   submitButton,
                                   errorLabel])
  }

  private func setBackgroundColors() {
    view.backgroundColor = Colors.whiteColor
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
    valueAmountForm.build().size(width: view.frame.width - Dimens.spacing16)
    dateForm.build().size(width: view.frame.width - Dimens.spacing16)
    cdiPercentForm.build().size(width: view.frame.width - Dimens.spacing16)
    submitButton.size(width: view.frame.width - Dimens.spacing16)
  }
}
