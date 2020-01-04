enum ApiError: Error {
  case unauthorized
  case forbidden
  case notFound
  case conflict
  case internalServerError
  case unknown
}
