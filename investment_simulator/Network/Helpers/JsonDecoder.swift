import Foundation

struct JsonDecoder {
  func decodeFromJson<T: Decodable>(_ objectType: T.Type, _ data: Data) -> RequestResult<T> {
    do {
      let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
      return RequestResult.success(decodedObject)
    } catch let error {
      return RequestResult.failure(RequestError.jsonParsingError(error))
    }
  }
}
