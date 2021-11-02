// DetailsViewModelTest.swift
// Copyright © RoadMap. All rights reserved.

@testable import Movie
import XCTest

final class DetailsViewModelTest: XCTestCase {
    var viewModel: DetailViewModelProtocol!
    var movieAPIService: NetworkServiceProtocol?
    var repository: MockRepository<Details>!

    override func setUpWithError() throws {
        repository = MockRepository<Details>()
        movieAPIService = MockMovieApiService()
        // viewModel = DetailViewModel(networkService: movieAPIService, id: 0)
    }

    override func tearDownWithError() throws {}

    func testMovieViewModel() throws {
        viewModel.updateViewData = {}

        guard let movie = viewModel.details else { return }
        // XCTAssertTrue(movie.realm?.isEmpty)
    }
}
