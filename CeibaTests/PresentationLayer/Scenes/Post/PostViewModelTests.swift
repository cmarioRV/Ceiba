//
//  PostViewModelTests.swift
//  CeibaTests
//
//  Created by Mario Rúa on 11/07/21.
//

import XCTest
@testable import Ceiba

class PostViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        AppDelegate.diContainer.registerDependencies()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPostViewModel_Init_ReturnSuccess() {
        let sut = AppDelegate.diContainer.resolve(PostViewModelType.self)
        XCTAssertNotNil(sut)
    }
    
    func testGetPosts_ReturnSuccess() {
        let sut = AppDelegate.diContainer.resolve(PostViewModelType.self)
        let expectation = expectation(description: "Return posts successfully")
        var postsResult: [Post]?
        var errorResult: Error?
        
        sut?.outputs.posts.bind { posts in
            postsResult = posts
            expectation.fulfill()
        }
        
        sut?.outputs.error.bind { error in
            errorResult = error
            expectation.fulfill()
        }
        
        sut?.inputs.getPosts()
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNotNil(postsResult)
            XCTAssertNil(errorResult)
        }
    }
}
