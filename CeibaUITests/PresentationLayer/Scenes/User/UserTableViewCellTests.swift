//
//  UserTableViewCellTests.swift
//  CeibaUITests
//
//  Created by Mario Rúa on 12/07/21.
//

import XCTest

class UserTableViewCellTests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserTableViewCell() throws {
        app.launch()
        XCTAssertTrue(app.isDisplayingUsersViewController)
    }
}
