// MainViewModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol MoviesViewModelProtocol: AnyObject {
    var results: [Results]? { get set }
    var updateViewData: (() -> ())? { get set }
    func fetchData()
}

final class MainViewModel: MoviesViewModelProtocol {
    var results: [Results]?
    var updateViewData: (() -> ())?

    func fetchData() {
        let jsonUrlString =
            "https://api.themoviedb.org/3/movie/popular?api_key=1ee34276a75d38c0cae118c698cdcfdf&language=ru-RU"
        guard let url = URL(string: jsonUrlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                guard let movies = try? decoder.decode(Movies.self, from: data) else { return }
                self.results = movies.results
                self.updateViewData?()
            } catch {
                print("Error")
            }
        }.resume()
    }
}
