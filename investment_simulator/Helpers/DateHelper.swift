import Foundation

struct DateHelper {
  static func getTodayDate() -> String {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    let result = formatter.string(from: date)
    return result
  }
}
