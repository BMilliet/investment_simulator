enum RequestResult<T> {
  case success(T)
  case failure(RequestError)
}
