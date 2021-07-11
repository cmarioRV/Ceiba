//
//  CoordinatorsTests.swift
//  CeibaTests
//
//  Created by Mario Rúa on 9/07/21.
//

import XCTest
@testable import Ceiba

class CoordinatorsTests: XCTestCase {

    override func setUpWithError() throws {
        AppDelegate.diContainer.registerDependencies()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAppCoordinator_Resolve_ReturnSuccess() {
        let sut = AppDelegate.diContainer.resolve(AppCoordinator.self)
        XCTAssertNotNil(sut)
    }
}
