//
//  UserViewControllerTests.swift
//  CeibaUITests
//
//  Created by Mario Rúa on 12/07/21.
//

import XCTest

class UserViewControllerTests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLauch_PresentUserViewController() throws {
        app.launch()
        XCTAssertTrue(app.isDisplayingUsersViewController)
    }
}
