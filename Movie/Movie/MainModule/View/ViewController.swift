// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController
final class ViewController: UIViewController {
    // MARK: - Private Properties

    var viewModel: MoviesViewModelProtocol!

    private var myTableView = UITableView()
    private let identifire = "MyCell"
    private var id: Int?
    private var titleLabel: String?
    private var imageString: String?
    private var overviewLabel: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Movie"
        createTableView()
        updateView()
    }

    func updateView() {
        viewModel.updateViewData = { [weak self] in
            DispatchQueue.main.async {
                self?.myTableView.reloadData()
            }
        }
    }

    func installViewModel(viewModel: MoviesViewModelProtocol) {
        self.viewModel = viewModel
    }

    // MARK: - create Private Medoth

    private func createTableView() {
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(MyTableViewCell.self, forCellReuseIdentifier: identifire)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(myTableView)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        200
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let id = viewModel.results?[indexPath.row].id else { return }
        let networkService = MovieAPIService()
        let newVC = DetailViewController()
        let detailViewModel = DetailViewModel(networkService: networkService, id: id)
        newVC.installViewModel(viewModel: detailViewModel)
        navigationController?.pushViewController(newVC, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        viewModel.results?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifire) as? MyTableViewCell
        else { return UITableViewCell() }
        guard let movie = viewModel.results?[indexPath.row] else { return UITableViewCell() }
        cell.configur(movie: movie)
        return cell
    }
}
