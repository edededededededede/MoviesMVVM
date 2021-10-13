// Detail.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class Detail: UIViewController {
    var presenter: DetailViewPresenterProtocol?

    // MARK: - Private Properties

    private var myTableView = UITableView()
    private let identifire = "Mycell"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createTableView()
        myTableView.accessibilityIdentifier = "DetailsTableView"
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

extension Detail: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        800
    }
}

extension Detail: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt _: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifire) as? InfoTableViewCell
        else { return UITableViewCell() }
        cell.backgroundColor = .white
        guard let res = presenter?.details else { return UITableViewCell() }
        cell.configurDetails(movie2: res)
        return cell
    }
}

extension Detail: DetailViewProtocol {
    func failure(error: Error) {
        print(error.localizedDescription)
    }

    func reloadData() {
        DispatchQueue.main.async {
            self.myTableView.reloadData()
        }
    }
}
