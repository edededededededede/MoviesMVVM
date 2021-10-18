// AssemblyTest.swift
// Copyright © RoadMap. All rights reserved.

@testable import Movie
import XCTest

final class AssemblyTest: XCTestCase {
    var assembly: AssamblyProtocol!

    override func setUpWithError() throws {
        assembly = Assambly()
    }

    override func tearDownWithError() throws {
        assembly = nil
    }

    func testAssamblySuccess() throws {
        let mainViewController = assembly.createMenuView()
        XCTAssertTrue(mainViewController is MainViewController)

        let detailsViewVontroller = assembly.createDetailsView(id: 0)
        XCTAssertTrue(detailsViewVontroller is DetailViewController)
    }

    func testAssemblyFailure() throws {
        let mainViewController = assembly.createMenuView()
        XCTAssertTrue(mainViewController is MainViewController)

        let detailsViewVontroller = assembly.createDetailsView(id: 0)
        XCTAssertTrue(detailsViewVontroller is DetailViewController)
    }
}
