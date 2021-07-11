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
        let sut = User(id: 1, name: "name", username: "username", email: "email", address: nil, phone: "phone", website: "website", company: nil)
        XCTAssert(sut.id == 1)
        XCTAssert(sut.name == "name")
        XCTAssert(sut.username == "username")
        XCTAssert(sut.email == "email")
        XCTAssert(sut.address == nil)
        XCTAssert(sut.phone == "phone")
        XCTAssert(sut.website == "website")
        XCTAssert(sut.company == nil)
    }
    
    func testErrorModel_Init_Success() {
        let sut = ErrorModel(key: "key", message: "message")
        XCTAssertEqual(sut.key, "key")
        XCTAssertEqual(sut.message, "message")
    }
    
    func testAddress_Init_Success() {
        let sut = Address(street: "street", suite: "suite", city: "city", zipcode: "zipcode", geo: nil, phone: "phone", website: "website", company: nil)
        
        XCTAssert(sut.street == "street")
        XCTAssert(sut.suite == "suite")
        XCTAssert(sut.city == "city")
        XCTAssert(sut.zipcode == "zipcode")
        XCTAssert(sut.geo == nil)
        XCTAssert(sut.phone == "phone")
        XCTAssert(sut.website == "website")
        XCTAssert(sut.company == nil)
    }
    
    func testGeo_Init_Success() {
        let sut = Geo(lat: "-37.312", lng: "61.454")
        XCTAssert(sut.lat == "-37.312")
        XCTAssert(sut.lng == "61.454")
    }
    
    func testCompany_Init_Success() {
        let sut = Company(name: "name", catchPhrase: "catchPhrase", bs: "bs")
        XCTAssert(sut.name == "name")
        XCTAssert(sut.catchPhrase == "catchPhrase")
        XCTAssert(sut.bs == "bs")
    }
    
    func testPost_Init_Success() {
        let sut = Post(userId: 1, id: 1, title: "title", body: "body")
        XCTAssert(sut.userId == 1)
        XCTAssert(sut.id == 1)
        XCTAssert(sut.title == "title")
        XCTAssert(sut.body == "body")
    }
}
