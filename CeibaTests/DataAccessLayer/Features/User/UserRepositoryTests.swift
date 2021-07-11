//
//  UserRepositoryTests.swift
//  CeibaTests
//
//  Created by Mario Rúa on 10/07/21.
//

import XCTest
@testable import Ceiba

class UserRepositoryTests: XCTestCase {

    override func setUpWithError() throws {
        AppDelegate.diContainer.registerDependencies()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserRepository_GetDependency_ReturnSuccessful() {
        let sut = AppDelegate.diContainer.resolve(UserRepository.self)
        XCTAssertNotNil(sut)
    }
    
    func testUserRepository_GetUsers_ReturnSuccessful() {
        let sut = AppDelegate.diContainer.resolve(UserRepository.self)
        let expectation = expectation(description: "Fetch correctly users from web service")
        var usersResult: [User]?
        var errorResult: Error?
        
        sut?.getUsers() { users, error in
            usersResult = users
            errorResult = error
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3) { error in
            XCTAssertNotNil(usersResult)
            XCTAssertNil(errorResult)
            XCTAssertNil(error)
        }
    }
}
