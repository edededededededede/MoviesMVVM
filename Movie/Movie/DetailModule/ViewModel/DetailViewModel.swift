// DetailViewModel.swift
// Copyright © Edo. All rights reserved.

import Foundation

protocol DetailViewModelProtocol: AnyObject {
    var details: Details? { get set }
    var updateViewData: (() -> ())? { get set }
    var movieAPIService: NetworkServiceProtocol? { get set }
    var showErrorAlert: StringHandler? { get set }
    func getDetail(id: Int)
    var repository: DataBaseRepository<Details>? { get set }
    var movie: [Details]? { get set }
}

final class DetailViewModel: DetailViewModelProtocol {
    var movieAPIService: NetworkServiceProtocol?
    var showErrorAlert: StringHandler?
    var updateViewData: (() -> ())?
    var repository: DataBaseRepository<Details>?
    var details: Details?
    var id: Int
    var movie: [Details]?
    let networkService: NetworkServiceProtocol?

    init(
        networkService: NetworkServiceProtocol?,
        repository: DataBaseRepository<Details>?,
        id: Int
    ) {
        self.networkService = networkService
        self.id = id
        self.repository = repository
        movie = repository?.getData()
        updateViewData?()
        getDetail(id: id)
    }

    func getDetail(id: Int) {
        movie = []
        networkService?.getDetails(id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                self.details = data
                self.movie?.append(data)
                DispatchQueue.main.async {
                    self.repository?.saveData(object: self.movie ?? [])
                }
                self.updateViewData?()
            case let .failure(error):
                self.showErrorAlert?(error.localizedDescription)
            }
        }
    }
}
