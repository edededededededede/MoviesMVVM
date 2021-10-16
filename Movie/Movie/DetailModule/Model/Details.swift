// Details.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift
/// struct for Details
final class Details: Object, Decodable {
    @objc dynamic var id = Int()
    @objc dynamic var title: String?
    @objc dynamic var overview: String?
    @objc dynamic var posterPath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
    }
}
