// MovieAPIService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol NetworkServiceProtocol {
    func getMovies(complition: @escaping (Result<[Results], Error>) -> Void)
    func getDetails(id: Int, complition: @escaping (Result<Details?, Error>) -> Void)
}

final class MovieAPIService: NetworkServiceProtocol {
    func getMovies(complition: @escaping (Result<[Results], Error>) -> Void) {
        let jsonUrlString =
            "https://api.themoviedb.org/3/movie/popular?api_key=1ee34276a75d38c0cae118c698cdcfdf&language=ru-RU"
        guard let url = URL(string: jsonUrlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let movies = try decoder.decode(Movies.self, from: data)
                complition(.success(movies.results))
            } catch {
                complition(.failure(error))
            }
        }.resume()
    }

    func getDetails(id: Int, complition: @escaping (Result<Details?, Error>) -> Void) {
        let jsonUrlString =
            "https://api.themoviedb.org/3/movie/\(id)?api_key=1ee34276a75d38c0cae118c698cdcfdf&language=ru-Ru"
        guard let url = URL(string: jsonUrlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let result2 = try decoder.decode(Details.self, from: data)
                complition(.success(result2))
            } catch {
                complition(.failure(error))
            }
        }.resume()
    }
}
