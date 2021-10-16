// DataBaseRepository.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

/// class
class DataBaseRepository<DataBaseEntity>: RepositoryProtocol {
    func getData() -> [DataBaseEntity]? {
        fatalError("Override required")
    }

    func saveData(object: [DataBaseEntity]) {
        fatalError("Override required")
    }
}
