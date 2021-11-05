// MainViewModeltest.swift
// Copyright © Edo. All rights reserved.

@testable import Movie
import XCTest

final class MainViewModeltest: XCTestCase {
    var viewModel: MoviesViewModelProtocol!
    var movieAPIService: NetworkServiceProtocol!
    var repository: MockRepository<Results>!

    override func setUpWithError() throws {
        repository = MockRepository<Results>()
        movieAPIService = MockMovieApiService()
        viewModel = MainViewModel(networkAPIService: movieAPIService, repository: repository)
    }

    override func tearDownWithError() throws {
        repository = nil
        movieAPIService = nil
        viewModel = nil
    }

    func testViewModel() throws {
        viewModel.updateViewData = {}

        guard let movies = viewModel.results else { return }
        XCTAssertTrue(!movies.isEmpty)
    }
}
