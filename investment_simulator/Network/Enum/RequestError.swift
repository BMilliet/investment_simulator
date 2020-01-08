enum RequestError: Error {
  case emptyDataError
  case jsonParsingError(Error)
  case invalidStatusCode(ApiError)
}
