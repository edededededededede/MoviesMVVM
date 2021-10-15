// MainViewModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol MoviesViewModelProtocol: AnyObject {
    var results: [Results]? { get set }
    var updateViewData: (() -> ())? { get set }
    func fetchData()
    var networkService: NetworkServiceProtocol? { get set }
}

final class MainViewModel: MoviesViewModelProtocol {
    var networkService: NetworkServiceProtocol?
    var movies: Movies?

    var results: [Results]?
    var updateViewData: (() -> ())?

    init(networkAPIService: NetworkServiceProtocol) {
        networkService = networkAPIService
        fetchData()
    }

    func fetchData() {
        networkService = MovieAPIService()
        networkService?.getMovies { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case let .success(movies):
                    self.results = movies
                    self.updateViewData?()
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
}
