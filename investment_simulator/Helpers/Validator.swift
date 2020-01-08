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

  func isValidDate(date: String, todayDate: String) -> Bool {
    guard let validDate = Date(date.convertDateInputFormat()) else { return false }
    guard let today = Date(todayDate.convertDateInputFormat()) else { return false }
    return validDate.timeIntervalSince1970 >= today.timeIntervalSince1970
  }

  private func hasValidNumberOfDots(_ stringValue: String) -> Bool {
    return (stringValue.filter { $0 == "." }.count) < 2
  }

  private func inValidPercentageRange(_ stringValue: String) -> Bool {
    guard let number = Double(stringValue) else { return false }
    return (number / 100) < 10.0
  }

  private func isNumber(_ stringValue: String) -> Bool {
    return (Double(stringValue) != nil)
  }
}
