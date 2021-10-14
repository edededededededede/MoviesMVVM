// DetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class DetailViewController: UIViewController {
    var viewModel: DetailViewModelProtocol?

    // MARK: - Private Properties

    private var myTableView = UITableView()
    private let identifire = "Mycell"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createTableView()
        setupModel()
    }

    // MARK: - Methods

    func setupModel() {
        viewModel?.updateViewData = { [weak self] in
            self?.myTableView.reloadData()
        }
        viewModel?.showErrorAlert = { [weak self] error in
            self?.showAlert(alertText: "error", alertMessage: error)
        }
    }

    func installViewModel(viewModel: DetailViewModelProtocol) {
        self.viewModel = viewModel
    }

    // MARK: - Private Methods

    func createTableView() {
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(InfoTableViewCell.self, forCellReuseIdentifier: identifire)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(myTableView)
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        800
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt _: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifire) as? InfoTableViewCell
        else { return UITableViewCell() }
        cell.backgroundColor = .white
        guard let res = viewModel?.details else { return UITableViewCell() }
        cell.configurDetails(movie2: res)
        return cell
    }
}
