//
//  UserServiceTests.swift
//  CeibaTests
//
//  Created by Mario Rúa on 10/07/21.
//

import XCTest
@testable import Ceiba

class UserServiceTests: XCTestCase {

    override func setUpWithError() throws {
        SceneDelegate.diContainer.registerDependencies(rootViewController: UINavigationController())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testUserService_GetDependency_ReturnSuccess() {
        let sut = SceneDelegate.diContainer.resolve(UserService.self)
        XCTAssertNotNil(sut)
    }

    func testUserService_FetchUsers_ReturnSuccessful() {
        let sut = SceneDelegate.diContainer.resolve(UserService.self)
        let expectation = expectation(description: "Fetch users successfully")
        var userResult: [User]?
        var errorResult: Error?
        
        sut?.getUsers(completion: { users, error in
            userResult = users
            errorResult = error
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNotNil(userResult)
            XCTAssertNil(errorResult)
        }
    }
}
