enum RequestError: Error {
  case jsonParsingError(Error)
  case invalidStatusCode(ApiError)
}
