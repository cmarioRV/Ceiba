//
//  PostService.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

class PostService {
    let repository: PostRepository
    
    init(repository: PostRepository) {
        self.repository = repository
    }
    
    func getPosts(completion: @escaping([Post]?, Error?) -> Void) {
        repository.getPosts(completion)
    }
    
    func getPostsByUser(userId: Int, completion: @escaping([Post]?, Error?) -> Void) {
        repository.getPosts(userId, completion)
    }
}
