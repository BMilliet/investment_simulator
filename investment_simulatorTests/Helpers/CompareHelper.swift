@testable import investment_simulator

struct CompareHelper {
  func isEqual(lhs: RequestError, rhs: ApiError) -> Bool {
    switch lhs {
    case .invalidStatusCode(ApiError.unauthorized):
      if (rhs == .unauthorized) { return true }
    case .invalidStatusCode(ApiError.forbidden):
      if (rhs == .forbidden) { return true }
    case .invalidStatusCode(ApiError.notFound):
      if (rhs == .notFound) { return true }
    case .invalidStatusCode(ApiError.conflict):
      if (rhs == .conflict) { return true }
    case .invalidStatusCode(ApiError.internalServerError):
      if (rhs == .internalServerError) { return true }
    case .invalidStatusCode(ApiError.unknown):
      if (rhs == .unknown) { return true }
    case .jsonParsingError(_):
      return false
    }
    return false
  }
}
