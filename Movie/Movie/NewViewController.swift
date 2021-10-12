// NewViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class NewViewController: UIViewController {
    var id: Int?
    var result2: Details?

    // MARK: - Private Properties

    private var myTableView = UITableView()
    private let identifire = "Mycell"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createTableView()
        fetchDescriptionData()
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

    // MARK: - Methods

    func fetchDescriptionData() {
        let jsonUrlString =
            "https://api.themoviedb.org/3/movie/\(id ?? 0)?api_key=1ee34276a75d38c0cae118c698cdcfdf&language=ru-Ru"
        guard let url = URL(string: jsonUrlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                self.result2 = try decoder.decode(Details.self, from: data)
                DispatchQueue.main.async {
                    self.myTableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

extension NewViewController: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        800
    }
}

extension NewViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt _: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifire) as? InfoTableViewCell
        else { return UITableViewCell() }
        cell.backgroundColor = .white
        guard let res = result2 else { return UITableViewCell() }
        cell.configurDetails(movie2: res)
        return cell
    }
}
