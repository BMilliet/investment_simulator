import Foundation

struct ValueRepresentation {
  func currency(_ value: Double) -> String {
    let base = baseFormat(value)
    let finalString = AppStrings.currency + " " + base
    return finalString
  }

  func mixedTaxesValue(_ amount: Double, _ percent: Double) -> String {
    let amountValue = currency(amount)
    let percentValue = "(" + baseFormat(percent) + "%)"
    return amountValue + percentValue
  }

  private func baseFormat(_ value: Double) -> String {
    let newValue = value.rounded(toPlaces: 2)
    let string = String(newValue)
    let divided = string.components(separatedBy: ".")
    var ints = String(divided[0].reversed()).separate(every: 3, with: ".")
    ints = String(ints.reversed())
    let finalString = ints + "," + divided[1]
    return finalString
  }
}
