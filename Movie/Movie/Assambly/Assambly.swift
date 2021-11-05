// Assambly.swift
// Copyright © Edo. All rights reserved.

import Foundation
import UIKit

protocol AssamblyProtocol {
    func createMenuView() -> UIViewController
    func createDetailsView(id: Int) -> UIViewController
}

final class Assambly: AssamblyProtocol {
    func createMenuView() -> UIViewController {
        let repository = RealmRepository<Results>()
        let movieAPIService = MovieAPIService()
        let menuViewModel = MainViewModel(networkAPIService: movieAPIService, repository: repository)
        let mainVC = MainViewController(viewModel: menuViewModel)
        return mainVC
    }

    func createDetailsView(id: Int) -> UIViewController {
        let repository = RealmRepository<Details>()
        let movieAPIService = MovieAPIService()
        let detailsViewModel = DetailViewModel(networkService: movieAPIService, repository: repository, id: id)
        let detailsVC = DetailViewController(viewModel: detailsViewModel)
        return detailsVC
    }
}
