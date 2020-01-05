import UIKit

struct MaskFormatter {
  func formatDateMask(_ baseText: String, _ char: String) -> String {
    var finalText = baseText
    let maskValue = Character("/")
    deletionHandle(&finalText, char, maskValue)
    if isMaxLength(baseText, 10) { return finalText }
    finalText.append(char)
    appendMaskAt(&finalText, especial: maskValue, index: 2)
    appendMaskAt(&finalText, especial: maskValue, index: 5)
    return finalText
  }

  func percentMask(_ baseText: String, _ char: String) -> String {
    var finalText = baseText
    let maskValue = Character(".")
    deletionHandle(&finalText, char, maskValue)
    if isMaxLength(baseText, 25) { return finalText }
    finalText.append(char)
    appendMaskAt(&finalText, especial: maskValue, index: 3)
    return finalText
  }

  func amountMask(_ baseText: String, _ char: String) -> String {
    var finalText = baseText
    if isBackSpace(char) {
      deleteLastChar(&finalText)
      return finalText
    }
    if isMaxLength(baseText, 25) { return finalText }
    finalText.append(char)
    return finalText
  }

  private func appendMaskAt(_ baseText: inout String,
                            especial: Character,
                            index: Int) {
    if baseText.count == index { baseText.append(especial) }
  }

  private func isMaxLength(_ baseText: String,
                           _ max: Int) -> Bool {
    return baseText.count == max
  }

  private func isBackSpace(_ char: String) -> Bool {
    return char == ""
  }

  private func deleteLastChar(_ baseText: inout String) {
    baseText.remove(at: baseText.index(before: baseText.endIndex))
  }

  private func deleteTwice(_ baseText: inout String) {
    deleteLastChar(&baseText)
    deleteLastChar(&baseText)
  }

  private func isMaskValue(_ baseText: String, _ maskValue: Character) -> Bool {
    return baseText.last == maskValue
  }

  private func deletionHandle(_ baseText: inout String, _ char: String, _ maskValue: Character) {
    if isBackSpace(char) {
      isMaskValue(baseText, maskValue) ?
        deleteTwice(&baseText) :
        deleteLastChar(&baseText)
    }
    return
  }
}
