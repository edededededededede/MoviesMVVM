// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController
final class ViewController: UIViewController {
    // MARK: - Private Properties

    private var myTableView = UITableView()
    private let identifire = "MyCell"
    private var id: Int?
    private var titleLabel: String?
    private var imageString: String?
    private var overviewLabel: String?
    var result: Movies?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Movie"
        createTableView()
        fetchData()
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

    // MARK: - create medoth

    func fetchData() {
        let jsonUrlString =
            "https://api.themoviedb.org/3/movie/popular?api_key=1ee34276a75d38c0cae118c698cdcfdf&language=ru-RU"
        guard let url = URL(string: jsonUrlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                self.result = try decoder.decode(Movies.self, from: data)
                DispatchQueue.main.async {
                    self.myTableView.reloadData()
                }
            } catch {
                print("Error")
            }

        }.resume()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        200
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newVC = NewViewController()
        newVC.id = result?.results[indexPath.row].id
        navigationController?.pushViewController(newVC, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        result?.results.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifire) as? MyTableViewCell
        else { return UITableViewCell() }
        guard let movie = result?.results[indexPath.row] else { return UITableViewCell() }
        cell.configur(movie: movie)
        return cell
    }
}
