import UIKit
import Quick
import Nimble

@testable import investment_simulator

class ApiRouterTest: QuickSpec {
  override func spec() {
    super.spec()

    let apiRouter = ApiRouter()

    describe("#getMoviesEndPoint") {
      context("build movies endPoint") {
        let expected = "https://api.themoviedb.org/3/movie/upcoming?api_key=1f54bd990f1cdfb230adb312546d765d&language=pt-BR"
        let subject = apiRouter.getMoviesEndPoint()!.absoluteString

        it("expected endpoint") {
          expect(subject).to(equal(expected))
        }
      }
    }

    describe("#getPosterData") {
      context("build poster endPoint") {
       let expected = "https://image.tmdb.org/t/p/w500/mockPath"
       let subject = apiRouter.getPosterEndPoint(with: "mockPath")!.absoluteString

        it("expected endpoint") {
          expect(subject).to(equal(expected))
        }
      }
    }

    describe("#getMovieGenres") {
      context("build genre endPoint") {
       let expected = "https://api.themoviedb.org/3/genre/movie/list?api_key=1f54bd990f1cdfb230adb312546d765d&language=pt-BR"
       let subject = apiRouter.getMovieGenres()!.absoluteString

        it("expected endpoint") {
          expect(subject).to(equal(expected))
        }
      }
    }
  }
}
