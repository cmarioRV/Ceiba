//
//  UserViewModelTests.swift
//  CeibaTests
//
//  Created by Mario Rúa on 11/07/21.
//

import XCTest
@testable import Ceiba

class UserViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        AppDelegate.diContainer.registerDependencies()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserViewModel_Init_ReturnSuccess() {
        let sut = AppDelegate.diContainer.resolve(UserViewModelType.self)
        XCTAssertNotNil(sut)
    }
    
    func testGetUsers_ReturnSuccess() {
        let sut = AppDelegate.diContainer.resolve(UserViewModelType.self)
        let expectation = expectation(description: "Return users successfully")
        var usersResult: [User]?
        var errorResult: Error?
        
        sut?.outputs.users.bind { users in
            usersResult = users
            expectation.fulfill()
        }
        
        sut?.outputs.error.bind { error in
            errorResult = error
            expectation.fulfill()
        }
        
        sut?.inputs.getUsers()
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNotNil(usersResult)
            XCTAssertNil(errorResult)
        }
    }
}
