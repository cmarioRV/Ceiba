//
//  PostViewModel.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

internal protocol PostViewModelInputs {
    func getPosts()
}

internal protocol PostViewModelOutputs {
    var posts: Dynamic<[Post]?> { get }
    var error: Dynamic<Error?> { get }
}

internal protocol PostViewModelType {
    var inputs: PostViewModelInputs { get }
    var outputs: PostViewModelOutputs { get }
}

internal final class PostViewModel: PostViewModelType, PostViewModelInputs, PostViewModelOutputs
{
    var inputs: PostViewModelInputs { return self }
    var outputs: PostViewModelOutputs { return self }
    
    var posts = Dynamic<[Post]?>(nil)
    var error = Dynamic<Error?>(nil)
    
    let postRepository: PostRepository
    
    init(postRepository: PostRepository) {
        self.postRepository = postRepository
    }
    
    func getPosts() {
        postRepository.getPosts { [weak self] posts, err in
            guard let posts = posts else {
                self?.error.value = err
                return
            }
            
            self?.posts.value = posts
        }
    }
}
