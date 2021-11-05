// MockAPIService.swift
// Copyright © Edo. All rights reserved.

@testable import Movie
import XCTest

final class MockMovieApiService: NetworkServiceProtocol {
    var movies: [Results] = []

    func getMovies(complition: @escaping (Result<[Results], Error>) -> Void) {
        let movie = Results()
        movie.id = 0
        movie.overview = "Bar"
        movie.posterPath = "BazBar"
        movie.releaseDate = "15.10.2021"
        movie.voteAverage = 0
        movies.append(movie)
        complition(.success(movies))
    }

    func getDetails(id: Int, complition: @escaping (Result<Details?, Error>) -> Void) {
        let movieDetails = Details()
        movieDetails.overview = "Bar"
        movieDetails.posterPath = "BazBar"
        complition(.success(movieDetails))
    }
}
