//
//  ApiManagerTests.swift
//  CeibaTests
//
//  Created by Mario Rúa on 10/07/21.
//

import XCTest
@testable import Ceiba

class ApiManagerTests: XCTestCase {

    override func setUpWithError() throws {
        AppDelegate.diContainer.registerDependencies()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetUsers_Init_Success() {
        let sut = AppDelegate.diContainer.resolve(ApiManager.self)
        XCTAssertNotNil(sut)
    }
}
