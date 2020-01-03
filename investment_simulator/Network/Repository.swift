import RxSwift

struct Repository {
  typealias Success<T> = (T) -> Void
  typealias Fail = (Error) -> Void

  private let disposeBag: DisposeBag
  private let session: URLSession
  private let reachability = ReachabilityHandler()

  init(session: URLSession = URLSession.shared, disposeBag: DisposeBag) {
    self.session = session
    self.disposeBag = disposeBag
  }

  func doRequest<T: Decodable>(_ url: URL,
                               _ objectType: T.Type,
                               _ onSuccess: @escaping Success<T>,
                               _ onError: @escaping Fail) {
    if !reachability.isDeviceConnected() { return }
    request(url, objectType, onSuccess, onError)
  }

  private func request<T: Decodable>(_ url: URL,
                                     _ objectType: T.Type,
                                     _ onSuccess: @escaping Success<T>,
                                     _ onError: @escaping Fail) {
    ApiClient(session).doRequest(url, objectType.self)
      .observeOn(MainScheduler.instance)
      .subscribe(onNext: { object in
        onSuccess(object)
      }, onError: { error in
        onError(error)
      }).disposed(by: disposeBag)
  }
}
