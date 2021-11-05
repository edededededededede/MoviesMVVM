// MovieTests.swift
// Copyright © Edo. All rights reserved.

@testable import Movie
import XCTest

final class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

final class MovieTests: XCTestCase {
    var aplicationCoordinator: AplicationCoordinator!
    var navigationController: MockNavigationController!
    var assambly: AssamblyProtocol!

    override func setUpWithError() throws {
        navigationController = MockNavigationController()
        assambly = Assambly()
        aplicationCoordinator = AplicationCoordinator(assambly: assambly, navController: navigationController)
    }

    override func tearDownWithError() throws {
        navigationController = nil
        assambly = nil
        aplicationCoordinator = nil
    }

    func testViewController() {
        aplicationCoordinator.start()
        let mainVC = navigationController.presentedVC
        XCTAssertTrue(mainVC is MainViewController)
    }

    func testDetailViewController() {
        aplicationCoordinator.start()
        guard let viewController = navigationController.presentedVC as? MainViewController else { return }
        viewController.onSelectID?(Int())
        let detailVC = navigationController.presentedVC
        XCTAssertTrue(detailVC is DetailViewController)
    }
}
