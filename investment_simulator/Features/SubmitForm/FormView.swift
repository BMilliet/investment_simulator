import UIKit

class FormView: UIViewController {
  let scrollView = UIScrollView()
  let valueAmountForm = FormViewUIContent.valueAmountForm()
  let dateForm = FormViewUIContent.dateForm()
  let cdiPercentForm = FormViewUIContent.CDIPercentForm()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupScrollView()
    setupLayoutComponents()
    view.backgroundColor = Colors.whiteColor
  }

  private func setupLayoutComponents() {
    setupValueAmountForm()
    setupDateForm()
    setupCDIPercentForm()
  }

  private func setupValueAmountForm() {
    scrollView.addSubview(valueAmountForm)
    valueAmountForm.anchor(top: scrollView.safeAreaLayoutGuide.topAnchor,
                           leading: scrollView.safeAreaLayoutGuide.leadingAnchor,
                           trailing: scrollView.safeAreaLayoutGuide.trailingAnchor,
                           padding: UIEdgeInsets(top: Dimens.spacing60,
                                                 left: Dimens.spacing16,
                                                 bottom: Dimens.zero,
                                                 right: -Dimens.spacing16))
  }

  private func setupDateForm() {
    scrollView.addSubview(dateForm)
    dateForm.anchor(top: valueAmountForm.safeAreaLayoutGuide.bottomAnchor,
                    leading: scrollView.safeAreaLayoutGuide.leadingAnchor,
                    trailing: scrollView.safeAreaLayoutGuide.trailingAnchor,
                    padding: UIEdgeInsets(top: Dimens.spacing60,
                                          left: Dimens.spacing16,
                                          bottom: Dimens.zero,
                                          right: -Dimens.spacing16))
  }

  private func setupCDIPercentForm() {
    scrollView.addSubview(cdiPercentForm)
    cdiPercentForm.anchor(top: dateForm.safeAreaLayoutGuide.bottomAnchor,
                          leading: scrollView.safeAreaLayoutGuide.leadingAnchor,
                          trailing: scrollView.safeAreaLayoutGuide.trailingAnchor,
                          padding: UIEdgeInsets(top: Dimens.spacing60,
                                                left: Dimens.spacing16,
                                                bottom: Dimens.zero,
                                                right: -Dimens.spacing16))
  }

  private func setupScrollView() {
    view.addSubview(scrollView)
    scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                      leading: view.safeAreaLayoutGuide.leadingAnchor,
                      bottom: view.safeAreaLayoutGuide.bottomAnchor,
                      trailing: view.safeAreaLayoutGuide.trailingAnchor)
  }
}
