import UIKit

struct FormTextFieldUIContent: CustomizableByClosure {
  lazy var titleLabel = customInit(UILabel()) { label in
    //label.emptyText()
    label.text = "some title"
    label.textColor = .black
    label.numberOfLines = 1
    label.textAlignment = .center
  }

  lazy var textField = customInit(UITextField()) { textField in
    textField.textAlignment = .center
    textField.textColor = .black
    textField.placeholder = "Enter text"
    textField.borderStyle = .none
  }

  lazy var bottonLine = customInit(UIView()) { line in
    line.size(height: 1)
    line.backgroundColor = .black
  }
}
