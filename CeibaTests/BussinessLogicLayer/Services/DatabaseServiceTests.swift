//
//  DatabaseRepositoryTests.swift
//  CeibaTests
//
//  Created by Mario Rúa on 11/07/21.
//

import XCTest
@testable import Ceiba

class DatabaseServiceTests: XCTestCase {

    override func setUpWithError() throws {
        AppDelegate.diContainer.registerDependencies()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDatabaseRepository_GetDependency_ReturnSuccess() {
        let sut = AppDelegate.diContainer.resolve(DatabaseService.self)
        XCTAssertNotNil(sut)
    }
    
    func testSaveUser_ValidUser_ReturnSuccess() {
        let sut = AppDelegate.diContainer.resolve(DatabaseService.self)
        
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
        
        sut?.saveUser(user: user)
        
        let fetchedUser = sut?.getUser(id: user.id)
        
        XCTAssertEqual(fetchedUser?.id, user.id)
        XCTAssertEqual(fetchedUser?.name, user.name)
        XCTAssertEqual(fetchedUser?.address?.city, user.address?.city)
        XCTAssertEqual(fetchedUser?.address?.street, user.address?.street)
        XCTAssertEqual(fetchedUser?.address?.suite, user.address?.suite)
        XCTAssertEqual(fetchedUser?.address?.zipcode, user.address?.zipcode)
        XCTAssertEqual(fetchedUser?.address?.geo?.lat, user.address?.geo?.lat)
        XCTAssertEqual(fetchedUser?.address?.geo?.lng, user.address?.geo?.lng)
        XCTAssertEqual(fetchedUser?.company?.bs, user.company?.bs)
        XCTAssertEqual(fetchedUser?.company?.catchPhrase, user.company?.catchPhrase)
        XCTAssertEqual(fetchedUser?.company?.name, user.company?.name)
        XCTAssertEqual(fetchedUser?.username, user.username)
        XCTAssertEqual(fetchedUser?.email, user.email)
        XCTAssertEqual(fetchedUser?.phone, user.phone)
        XCTAssertEqual(fetchedUser?.website, user.website)
    }
}
