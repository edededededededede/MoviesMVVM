// MovieUITests.swift
// Copyright © RoadMap. All rights reserved.

import XCTest

final class MovieUITests: XCTestCase {
    var application: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        application = XCUIApplication()
        application.launch()
    }

    override func tearDownWithError() throws {}

    func testMovieTableView() {
        let movieTableView = application.tables["MovieTableView"]
        XCTAssertTrue(movieTableView.exists)
        XCTAssertTrue(movieTableView.isEnabled)
        movieTableView.swipeUp()
        movieTableView.swipeDown()
    }

    func testCellMovieViewController() {
        let movieTableView = application.tables["MovieTableView"]
        let cell = movieTableView.cells["MovieTableViewCell"]
        XCTAssertTrue(cell.exists)
        XCTAssertTrue(cell.firstMatch.isHittable)
        cell.firstMatch.tap()
    }

    func testDetailViewController() {
        showDetailScreen()
        let detailTableView = application.tables["DetailsTableView"]
        XCTAssertTrue(detailTableView.exists)
        XCTAssertTrue(detailTableView.isHittable)
        detailTableView.swipeUp()
        detailTableView.swipeDown()
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }

    func showDetailScreen() {
        let movieTableView = application.tables["MovieTableView"]
        let cell = movieTableView.cells["MovieTableViewCell"]
        cell.firstMatch.tap()
    }
}
