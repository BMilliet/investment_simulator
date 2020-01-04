import UIKit

class FormView: UIViewController {
  let scrollView = UIScrollView()
  let valueAmountForm = FormViewUIContent.valueAmountForm()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupScrollView()
    setupLayoutComponents()
    view.backgroundColor = Colors.whiteColor
  }

  private func setupLayoutComponents() {
    scrollView.addSubview(valueAmountForm)
    valueAmountForm.size(height: 80)
    valueAmountForm.anchor(top: scrollView.safeAreaLayoutGuide.topAnchor,
                           leading: scrollView.safeAreaLayoutGuide.leadingAnchor,
                           trailing: scrollView.safeAreaLayoutGuide.trailingAnchor,
                           padding: UIEdgeInsets(top: 20,
                                                 left: 16,
                                                 bottom: -100,
                                                 right: -16))

//    let test = UIView()
//    scrollView.addSubview(test)
//    test.backgroundColor = .cyan
//    test.size(height: 2000)
//
//    test.anchor(top: box.safeAreaLayoutGuide.bottomAnchor,
//                leading: scrollView.safeAreaLayoutGuide.leadingAnchor,
//                trailing: scrollView.safeAreaLayoutGuide.trailingAnchor)
  }

  private func setupScrollView() {
    view.addSubview(scrollView)
    scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                      leading: view.safeAreaLayoutGuide.leadingAnchor,
                      bottom: view.safeAreaLayoutGuide.bottomAnchor,
                      trailing: view.safeAreaLayoutGuide.trailingAnchor)
  }
}
