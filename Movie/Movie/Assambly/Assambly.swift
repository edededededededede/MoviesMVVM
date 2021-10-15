// Assambly.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

protocol AssamblyProtocol {
    func createMenuView() -> UIViewController
    func createDetailsView(id: Int) -> UIViewController
}

final class Assambly: AssamblyProtocol {
    func createMenuView() -> UIViewController {
        let mainVC = MainViewController()
        let movieAPIService = MovieAPIService()
        let menuViewModel = MainViewModel(networkAPIService: movieAPIService)
        mainVC.installViewModel(viewModel: menuViewModel)
        return mainVC
    }

    func createDetailsView(id: Int) -> UIViewController {
        let detailsVC = DetailViewController()
        let movieAPIService = MovieAPIService()
        let detailsViewModel = DetailViewModel(networkService: movieAPIService, id: id)
        detailsVC.installViewModel(viewModel: detailsViewModel)
        return detailsVC
    }
}
