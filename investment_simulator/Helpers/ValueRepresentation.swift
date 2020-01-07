import Foundation

struct ValueRepresentation {
  func currency(_ value: Double) -> String {
    let newValue = value.rounded(toPlaces: 2)
    let string = String(newValue)
    let divided = string.components(separatedBy: ".")
    var ints = String(divided[0].reversed()).separate(every: 3, with: ".")
    ints = String(ints.reversed())
    let finalString = AppStrings.currency + " " + ints + "," + divided[1]
    return finalString
  }
}


extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension String {
    func separate(every stride: Int = 4, with separator: Character = " ") -> String {
        return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
    }
}
