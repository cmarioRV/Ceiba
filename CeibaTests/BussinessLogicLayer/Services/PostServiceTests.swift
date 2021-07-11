//
//  PostServiceTests.swift
//  CeibaTests
//
//  Created by Mario Rúa on 11/07/21.
//

import XCTest
@testable import Ceiba

class PostServiceTests: XCTestCase {

    override func setUpWithError() throws {
        AppDelegate.diContainer.registerDependencies()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPostService_GetDependency_ReturnSuccess() {
        let sut = AppDelegate.diContainer.resolve(PostService.self)
        XCTAssertNotNil(sut)
    }
    
    func testPostService_FetchPost_ReturnSuccessful() {
        let sut = AppDelegate.diContainer.resolve(PostService.self)
        let expectation = expectation(description: "Fetch posts successfully")
        var postsResult: [Post]?
        var errorResult: Error?
        
        sut?.getPosts(completion: { posts, error in
            postsResult = posts
            errorResult = error
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNotNil(postsResult)
            XCTAssertNil(errorResult)
        }
    }
    
    func testPostService_FetchPostByUser_ReturnSuccessful() {
        let sut = AppDelegate.diContainer.resolve(PostService.self)
        let expectation = expectation(description: "Fetch posts by user successfully")
        var postsResult: [Post]?
        var errorResult: Error?
        
        sut?.getPostsByUser(userId: 1, completion: { posts, error in
            postsResult = posts
            errorResult = error
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNotNil(postsResult)
            XCTAssertNil(errorResult)
        }
    }
}
