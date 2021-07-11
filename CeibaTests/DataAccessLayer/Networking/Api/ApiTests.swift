//
//  ApiTests.swift
//  CeibaTests
//
//  Created by Mario Rúa on 10/07/21.
//

import XCTest
@testable import Ceiba

class ApiTests: XCTestCase {

    override func setUpWithError() throws {
        AppDelegate.diContainer.registerDependencies()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testApi_GetBaseUrl_ReturnSuccess() {
        XCTAssert(Api.baseURL == "https://jsonplaceholder.typicode.com/")
    }
    
    func testApi_GetUserEndpoint_ReturnSuccess() {
        XCTAssert(EndPoint.users == "users")
        XCTAssert(EndPoint.posts == "posts")
    }
}
