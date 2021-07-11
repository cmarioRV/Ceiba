//
//  MockPostRepository.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

class MockPostRepository: PostRepository {
    let apiManager: ApiManager
    
    init(apiManager: ApiManager) {
        self.apiManager = apiManager
    }
    
    func getPosts(_ completion: @escaping ([Post]?, Error?) -> Void) {
        completion([Post](), nil)
    }
    
    func getPosts(_ userId: Int, _ completion: @escaping ([Post]?, Error?) -> Void) {
        completion([Post](), nil)
    }
}
