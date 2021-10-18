// DetailViewModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol DetailViewModelProtocol: AnyObject {
    var details: Details? { get set }
    var updateViewData: (() -> ())? { get set }
    var movieAPIService: NetworkServiceProtocol? { get set }
    var showErrorAlert: StringHandler? { get set }
    func getDetail(id: Int)
}

final class DetailViewModel: DetailViewModelProtocol {
    var movieAPIService: NetworkServiceProtocol?
    var showErrorAlert: StringHandler?
    var updateViewData: (() -> ())?
    var details: Details?
    var id: Int
    let networkService: NetworkServiceProtocol?

    init(networkService: MovieAPIService, id: Int) {
        self.networkService = networkService
        self.id = id
        getDetail(id: id)
    }

    func getDetail(id: Int) {
        networkService?.getDetails(id: id) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    self.details = data
                    self.updateViewData?()
                case let .failure(error):
                    self.showErrorAlert?(error.localizedDescription)
                }
            }
        }
    }
}
