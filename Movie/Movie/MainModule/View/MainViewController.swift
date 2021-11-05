// MainViewController.swift
// Copyright © Edo. All rights reserved.

import UIKit

/// ViewController
final class MainViewController: UIViewController {
    // MARK: - Private Properties

    var viewModel: MoviesViewModelProtocol?
    var onSelectID: IntHandler?

    private var tableView = UITableView()
    private let identifire = "MyCell"
    private var id: Int?
    private var titleLabel: String?
    private var imageString: String?
    private var overviewLabel: String?

    convenience init(viewModel: MoviesViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Movie"
        createTableView()
        updateView()
        tableView.accessibilityIdentifier = "MovieTableView"
    }

    func updateView() {
        viewModel?.updateViewData = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: - create Private Medoth

    private func createTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: identifire)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(tableView)
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        200
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let id = viewModel?.results?[indexPath.row].id else { return }
        onSelectID?(id)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        viewModel?.results?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifire) as? MyTableViewCell
        else { return UITableViewCell() }
        guard let movie = viewModel?.results?[indexPath.row] else { return UITableViewCell() }
        cell.configur(movie: movie)
        return cell
    }
}
