import UIKit

class FormView: UIViewController {
  let formTextField = FormTextField()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = Colors.whiteColor

    let box = formTextField.build()

    view.addSubview(box)

    box.size(height: 80)

    box.anchor(top: view.safeAreaLayoutGuide.topAnchor,
               leading: view.safeAreaLayoutGuide.leadingAnchor,
               trailing: view.safeAreaLayoutGuide.trailingAnchor,
               padding: UIEdgeInsets(top: 20, left: 16, bottom: -100, right: -16))

  }
}
