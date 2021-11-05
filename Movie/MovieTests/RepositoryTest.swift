// RepositoryTest.swift
// Copyright © Edo. All rights reserved.

@testable import Movie
import XCTest

final class RepositoryTest: XCTestCase {
    private var repository: RealmRepository<MockModel>!
    private var testVar = MockModel()

    override func setUpWithError() throws {
        repository = RealmRepository<MockModel>()
    }

    override func tearDownWithError() throws {
        repository = nil
    }

    func testRepository() throws {
        testVar.mockName = "Baz"
        let testArray = [testVar]

        repository.saveData(object: testArray)

        let result = repository.getData()
        XCTAssertEqual(testArray.first?.mockName, result?.first?.mockName)
    }
}
