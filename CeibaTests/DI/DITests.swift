//
//  DITests.swift
//  CeibaTests
//
//  Created by Mario Rúa on 9/07/21.
//

import XCTest
@testable import Ceiba

class DITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testContainer_GetContainer_ReturnSuccess() {
        XCTAssertNotNil(AppDelegate.diContainer)
    }
}
