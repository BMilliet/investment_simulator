struct StatusCodeHandler {
  func isInvalidStatusCode(_ statusCode: Int) -> Bool {
    return !(200 ... 299).contains(statusCode)
  }

  func emptyDataError() -> RequestError {
    return RequestError.emptyDataError
  }

  func returnApiError(for statusCode: Int) -> RequestError {
    switch statusCode {
    case 401:
      return RequestError.invalidStatusCode(.unauthorized)
    case 403:
      return RequestError.invalidStatusCode(.forbidden)
    case 404:
      return RequestError.invalidStatusCode(.notFound)
    case 409:
      return RequestError.invalidStatusCode(.conflict)
    case 500:
      return RequestError.invalidStatusCode(.internalServerError)
    default:
      return RequestError.invalidStatusCode(.unknown)
    }
  }
}
