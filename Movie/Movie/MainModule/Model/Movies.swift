// Movies.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift
/// структура
struct Movies: Decodable {
    let results: [Results]
}

/// структура
final class Results: Object, Decodable {
    @objc dynamic var id = Int()
    @objc dynamic var title: String?
    @objc dynamic var overview: String?
    @objc dynamic var voteAverage = Double()
    @objc dynamic var posterPath: String?
    @objc dynamic var releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}
