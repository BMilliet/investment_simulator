import UIKit
import Quick
import Nimble

@testable import investment_simulator

class CustomizableByClosureTest: QuickSpec, CustomizableByClosure {
  override func spec() {
    super.spec()

    let textMock = "textValue"

    describe("#customInit") {
      context("test custom init") {

        let textView = self.customInit(UITextView()) {
          $0.text = textMock
          $0.isEditable = true
          $0.isHidden = false
          $0.allowsEditingTextAttributes = true
        }

        it("compare values") {
          expect(textView.text).to(equal(textMock))
          expect(textView.isEditable).to(beTrue())
          expect(textView.isHidden).to(beFalse())
          expect(textView.allowsEditingTextAttributes).to(beTrue())
        }
      }
    }
  }
}
