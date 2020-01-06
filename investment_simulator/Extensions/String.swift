import Foundation

extension String {
  func convertDateInputFormat() -> String {
    return convert(dateString: self, fromDateFormat: "dd/MM/yyyy", toDateFormat: "yyyy-MM-dd") ?? "0"
  }

  private func convert(dateString: String, fromDateFormat: String, toDateFormat: String) -> String? {
    let fromDateFormatter = DateFormatter()
    fromDateFormatter.dateFormat = fromDateFormat

    if let fromDateObject = fromDateFormatter.date(from: dateString) {
      let toDateFormatter = DateFormatter()
      toDateFormatter.dateFormat = toDateFormat
      let newDateString = toDateFormatter.string(from: fromDateObject)
      return newDateString
    }
    return nil
  }
}
