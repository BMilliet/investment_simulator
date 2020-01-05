import Foundation

struct Validator {
  func hasEmptyValues(_ values: [String]) -> Bool {
    return values.contains { $0 == "" }
  }

  func isValidAmount(_ stringValue: String) -> Bool {
    if !isNumber(stringValue) { return false }
    return hasValidNumberOfDots(stringValue)
  }

  func isValidPercentage(_ stringValue: String) -> Bool {
    return (hasValidNumberOfDots(stringValue) && inValidPercentageRange(stringValue))
  }

//  func isValidDate(_ stringDate: String) -> Bool {
//    let date = Date()
//    let formatter = DateFormatter()
//    formatter.dateFormat = "dd.MM.yyyy"
//    let result = formatter.string(from: date)
//    return true
//  }

  private func hasValidNumberOfDots(_ stringValue: String) -> Bool {
    return (stringValue.filter { $0 == "." }.count) < 2
  }

  private func inValidPercentageRange(_ stringValue: String) -> Bool {
    guard let number = Double(stringValue) else { return false }
    return (number / 100) < 10.0
  }

  private func isNumber(_ stringValue: String) -> Bool {
    guard let _ = Double(stringValue) else { return false }
    return true
  }
}
