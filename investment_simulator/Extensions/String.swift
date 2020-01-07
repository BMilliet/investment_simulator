import Foundation

extension String {
  func convertDateInputFormat() -> String {
    return convert(dateString: self, fromDateFormat: "dd/MM/yyyy", toDateFormat: "yyyy-MM-dd") ?? "0"
  }

  func separate(every stride: Int = 4,
                with separator: Character = " ") -> String {
    return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
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
