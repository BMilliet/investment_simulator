import Foundation
import RxSwift

struct ApiClient {
  private let session: URLSession

  init(_ session: URLSession) {
    self.session = session
  }

  func doRequest<T: Decodable>(_ url: URL, _ objectType: T.Type) -> Observable<T> {
    return Observable<T>.create { observable in
      self.request(url, objectType.self) { (result: RequestResult) in
        switch result {
        case .failure(let error):
          observable.onError(error)

        case .success(let object):
          observable.onNext(object)
          observable.onCompleted()
        }
      }
      return Disposables.create()
    }
  }

  func getPosterData(_ path: URL) -> Data? {
    do { return try Data(contentsOf: path)
    } catch { return nil }
  }

  private func request<T: Decodable>(_ url: URL,
                                     _ objectType: T.Type,
                                     _ completion: @escaping (RequestResult<T>) -> Void) {
    session.dataTask(with: url, completionHandler: { data, response, _ in
      if let httpResponse = response as? HTTPURLResponse {
        let handler = StatusCodeHandler()
        if handler.isInvalidStatusCode(httpResponse.statusCode) {
          return completion(RequestResult.failure(handler.returnApiError(for: httpResponse.statusCode)))
        }
      }
      completion(JsonDecoder().decodeFromJson(objectType, data))
    }).resume()
  }
}
