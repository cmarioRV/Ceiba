//
//  UserViewControllerTests.swift
//  CeibaTests
//
//  Created by Mario Rúa on 12/07/21.
//

import XCTest
@testable import Ceiba

class UserViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        SceneDelegate.diContainer.registerDependencies(rootViewController: UINavigationController())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserViewController_GetDependency_ReturnSuccess() {
        let sut = SceneDelegate.diContainer.resolve(UserViewController.self)
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut?.viewModel)
    }
}
