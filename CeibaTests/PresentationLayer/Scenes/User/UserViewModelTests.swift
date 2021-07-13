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
        SceneDelegate.diContainer.registerDependencies(rootViewController: UINavigationController())
        let dbService = SceneDelegate.diContainer.resolve(DatabaseService.self)
        dbService?.deleteAllUsers()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserViewModel_Init_ReturnSuccess() {
        let sut = SceneDelegate.diContainer.resolve(UserViewModelType.self)
        XCTAssertNotNil(sut)
    }
    
    func testGetUsers_FromService_ReturnSuccess() {
        let sut = SceneDelegate.diContainer.resolve(UserViewModelType.self)
        let expectation = expectation(description: "Return users successfully")
        var usersResult: [UserCellViewModel]?
        var errorResult: Error?
        
        sut?.outputs.cellViewModels.bind { users in
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
        let sut = SceneDelegate.diContainer.resolve(UserViewModelType.self)
        let expectation = expectation(description: "Return users successfully")
        var usersResult: [UserCellViewModel]?
        
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

        sut?.outputs.cellViewModels.bind { users in
            usersResult = users
            expectation.fulfill()
        }
        
        sut?.inputs.getUsersFromDB()
        
        waitForExpectations(timeout: 1) { error in
            XCTAssertNotNil(usersResult)
        }
    }
    
    func testGetUsers_DoubleRequest_OnlyExecuteOnes() {
        let sut = SceneDelegate.diContainer.resolve(UserViewModelType.self)
        var callsCounter = 0
        
        sut?.outputs.cellViewModels.bind({ users in
            callsCounter += 1
        })
        
        sut?.inputs.getUsers()
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.2) {
            sut?.inputs.getUsers()
        }
        
        expectToEventually(callsCounter == 1, timeout: 1, message: "Admit only ones request to get users at the same time")
    }
    
    func testCellViewModels_Get_ReturnSuccess() {
        let sut = SceneDelegate.diContainer.resolve(UserViewModelType.self)
        let expectation = expectation(description: "Return cell view models successfully")
        var viewModelsResult: [UserCellViewModel]?
                
        sut?.outputs.cellViewModels.bind { viewModels in
            viewModelsResult = viewModels
            expectation.fulfill()
        }
        
        sut?.inputs.getUsers()
        
        waitForExpectations(timeout: 1) { error in
            XCTAssertNotNil(viewModelsResult)
        }
    }
    
    func testSearchUser_ByName_ReturnSuccess() {
        let sut = SceneDelegate.diContainer.resolve(UserViewModelType.self)
        let expectation = expectation(description: "Search user successfully")
        var viewModelsResult: [UserCellViewModel]?
        
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
        
        let user1 = User()
        user1.id = 0
        user1.name = "Mario"
        user1.address = address
        user1.company = company
        user1.email = "test@email.com"
        user1.phone = "222"
        user1.username = "1"
        user1.website = "1"
        
        let user2 = User()
        user2.id = 0
        user2.name = "Maria"
        user2.address = address
        user2.company = company
        user2.email = "test@email.com"
        user2.phone = "222"
        user2.username = "1"
        user2.website = "1"
        
        let user3 = User()
        user3.id = 0
        user3.name = "Laura"
        user3.address = address
        user3.company = company
        user3.email = "test@email.com"
        user3.phone = "222"
        user3.username = "1"
        user3.website = "1"
        
        sut?.inputs.saveUser(user1)
        sut?.inputs.saveUser(user2)
        sut?.inputs.saveUser(user3)
        
        sut?.outputs.cellViewModels.bind({ viewModels in
            viewModelsResult = viewModels
            expectation.fulfill()
        })
        
        sut?.inputs.search(name: "Clas")
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNotNil(viewModelsResult)
        }
    }
}
