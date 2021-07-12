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
        let dbService = AppDelegate.diContainer.resolve(DatabaseService.self)
        dbService?.deleteAllUsers()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserViewModel_Init_ReturnSuccess() {
        let sut = AppDelegate.diContainer.resolve(UserViewModelType.self)
        XCTAssertNotNil(sut)
    }
    
    func testGetUsers_FromService_ReturnSuccess() {
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
    
    func testGetUsers_FromDataBase_ReturnSuccess() {
        let sut = AppDelegate.diContainer.resolve(UserViewModelType.self)
        let expectation = expectation(description: "Return users successfully")
        var usersResult: [User]?
        var errorResult: Error?
        
        let geo = Geo()
        geo.lat = "12.04"
        geo.lng = "-75.8"
        
        let address = Address()
        address.city = "Medellin"
        address.street = "33"
        address.suite = "1"
        address.zipcode = "005"
        address.geo = geo
        
        let company = Company()
        company.name = "OA"
        company.catchPhrase = "test"
        company.bs = "1"
        
        let user = User()
        user.id = 0
        user.name = "name"
        user.address = address
        user.company = company
        user.email = "test@email.com"
        user.phone = "222"
        user.username = "1"
        user.website = "1"
        
        sut?.inputs.saveUser(user)

        sut?.outputs.users.bind { users in
            usersResult = users
            expectation.fulfill()
        }
        
        sut?.inputs.getUsersFromDB()
        
        waitForExpectations(timeout: 1) { error in
            XCTAssertNotNil(usersResult)
            XCTAssertNil(errorResult)
        }
    }
    
    func testGetUsers_DoubleRequest_OnlyExecuteOnes() {
        let sut = AppDelegate.diContainer.resolve(UserViewModelType.self)
        var callsCounter = 0
        
        sut?.outputs.users.bind({ users in
            callsCounter += 1
        })
        
        sut?.inputs.getUsers()
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.2) {
            sut?.inputs.getUsers()
        }
        
        expectToEventually(callsCounter == 1, timeout: 1, message: "Admit only ones request to get users at the same time")
    }
}
