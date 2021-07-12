//
//  UserTests.swift
//  CeibaTests
//
//  Created by Mario Rúa on 10/07/21.
//

import XCTest
@testable import Ceiba

class ModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUser_Init_Successful() {
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
        
        let sut = User()
        sut.id = 0
        sut.name = "name"
        sut.address = address
        sut.company = company
        sut.email = "email"
        sut.phone = "phone"
        sut.username = "username"
        sut.website = "website"
        
        XCTAssert(sut.id == 0)
        XCTAssert(sut.name == "name")
        XCTAssert(sut.username == "username")
        XCTAssert(sut.email == "email")
        XCTAssert(sut.phone == "phone")
        XCTAssert(sut.website == "website")
    }
    
    func testErrorModel_Init_Success() {
        let sut = ErrorModel(key: "key", message: "message")
        XCTAssertEqual(sut.key, "key")
        XCTAssertEqual(sut.message, "message")
    }
    
    func testAddress_Init_Success() {
        let sut = Address()
        sut.city = "city"
        sut.street = "street"
        sut.suite = "suite"
        sut.zipcode = "zipcode"
        
        XCTAssert(sut.street == "street")
        XCTAssert(sut.suite == "suite")
        XCTAssert(sut.city == "city")
        XCTAssert(sut.zipcode == "zipcode")
    }
    
    func testGeo_Init_Success() {
        let sut = Geo()
        sut.lat = "12.04"
        sut.lng = "-75.8"
        
        XCTAssert(sut.lat == "12.04")
        XCTAssert(sut.lng == "-75.8")
    }
    
    func testCompany_Init_Success() {
        let sut = Company()
        sut.name = "name"
        sut.catchPhrase = "catchPhrase"
        sut.bs = "bs"
        
        XCTAssert(sut.name == "name")
        XCTAssert(sut.catchPhrase == "catchPhrase")
        XCTAssert(sut.bs == "bs")
    }
    
    func testPost_Init_Success() {
        let sut = Post()
        sut.id = 1
        sut.userId = 1
        sut.title = "title"
        sut.body = "body"
        XCTAssert(sut.userId == 1)
        XCTAssert(sut.id == 1)
        XCTAssert(sut.title == "title")
        XCTAssert(sut.body == "body")
    }
}
