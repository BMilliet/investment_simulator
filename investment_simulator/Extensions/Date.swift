import Foundation

extension Date {
  init?(_ dateString: String) {
    let dateStringFormatter = DateFormatter()
    dateStringFormatter.dateFormat = "yyyy-MM-dd"
    dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
    guard let date = dateStringFormatter.date(from: dateString) else { return nil }
    self.init(timeInterval: 0, since: date)
  }
}
