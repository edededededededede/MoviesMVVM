// RepositoryTest.swift
// Copyright © RoadMap. All rights reserved.

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

// final class RepositoryTest: XCTestCase {
//    private var repository: RealmRepository<MockModel>!
//    private var testVar = MockModel()
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
// }
