//
//  PostRepositoryTests.swift
//  CeibaTests
//
//  Created by Mario Rúa on 11/07/21.
//

import XCTest
@testable import Ceiba

class PostRepositoryTests: XCTestCase {

    override func setUpWithError() throws {
        SceneDelegate.diContainer.registerDependencies(rootViewController: UINavigationController())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPostRepository_GetDependency_ReturnSuccess() {
        let sut = SceneDelegate.diContainer.resolve(PostRepository.self)
        XCTAssertNotNil(sut)
    }
    
    func testPostRepository_GetPosts_ReturnSuccessful() {
        let sut = SceneDelegate.diContainer.resolve(PostRepository.self)
        let expectation = expectation(description: "Fetch correctly posts from web service")
        var postsResult: [Post]?
        var errorResult: Error?
        
        sut?.getPosts() { posts, error in
            postsResult = posts
            errorResult = error
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3) { error in
            XCTAssertNotNil(postsResult)
            XCTAssertNil(errorResult)
            XCTAssertNil(error)
        }
    }
    
    func testPostRepository_GetPostsByUser_ReturnSuccessful() {
        let sut = SceneDelegate.diContainer.resolve(PostRepository.self)
        let expectation = expectation(description: "Fetch correctly posts from web service")
        var postsResult: [Post]?
        var errorResult: Error?
        
        sut?.getPosts(1) { posts, error in
            postsResult = posts
            errorResult = error
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3) { error in
            XCTAssertNotNil(postsResult)
            XCTAssertNil(errorResult)
            XCTAssertNil(error)
        }
    }
}
