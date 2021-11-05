// MockRepository.swift
// Copyright © Edo. All rights reserved.

@testable import Movie
import RealmSwift
import XCTest

final class MockRepository<RealmEntity: Object>: DataBaseRepository<RealmEntity> {
    override func getData() -> [RealmEntity]? {
        nil
    }

    override func saveData(object: [RealmEntity]) {}
}
