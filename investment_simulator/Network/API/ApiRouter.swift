import Foundation
import UIKit

struct ApiRouter {
  private let ptBr = "pt-BR"
  private let keyPrefix = "api_key"
  private let lenguage = "language"
  private let upcoming = "/upcoming"
  private let list = "/list"
  private let movieDetailOption = "/movie"
  private let movieGenreOption = "/genre"
  private let APIBaseUrl = "https://api.themoviedb.org/3"
  private let apiKey = "1f54bd990f1cdfb230adb312546d765d"
  private let APIPosterUrl = "https://image.tmdb.org/t/p/w500/"

  func getMoviesEndPoint() -> URL? {
    return buildParams(
      URL(string: buildPath([APIBaseUrl, movieDetailOption, upcoming])), apiKey)
  }

  func getPosterEndPoint(with path: String) -> URL? {
    return URL(string: buildPath([APIPosterUrl, path]))
  }

  func getMovieGenres() -> URL? {
    return buildParams(
      URL(string: buildPath([APIBaseUrl, movieGenreOption, movieDetailOption, list])), apiKey)
  }

  private func buildParams(_ base: URL?, _ userKey: String) -> URL? {
    return base?.appending([URLQueryItem(name: keyPrefix, value: userKey),
                            URLQueryItem(name: lenguage, value: ptBr)])
  }

  private func buildPath(_ array: [String]) -> String {
    return array.joined()
  }
}
