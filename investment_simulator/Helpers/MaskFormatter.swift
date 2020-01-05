import UIKit

struct MaskFormatter {
  func formatDateMask(_ baseText: String, _ char: String) -> String {
    var finalText = baseText

    if char == "" { return "" }

    if finalText.count == 10 {
      return finalText
    }

    finalText.append(char)

    if finalText.count == 2 || finalText.count == 5 {
      finalText.append("/")
    }
    return finalText
  }

  func percentMask(_ baseText: String, _ char: String) -> String {
    var finalText = baseText

    if char == ""{
      finalText.remove(at: finalText.index(before: finalText.endIndex))
      return finalText
    }

    if finalText.count == 3 {
      return finalText
    }
    finalText.append(char)
    return finalText
  }

  func amountMask(_ baseText: String, _ char: String) -> String {
    var finalText = baseText

    if char == ""{
      finalText.remove(at: finalText.index(before: finalText.endIndex))
      return finalText
    }

    if finalText.count == 20 {
      return finalText
    }
    finalText.append(char)
    return finalText
  }
}
