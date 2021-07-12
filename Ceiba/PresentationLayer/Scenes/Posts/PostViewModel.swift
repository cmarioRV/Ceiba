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
    
    let postService: PostService
    
    init(postService: PostService) {
        self.postService = postService
    }
    
    func getPosts() {
        postService.getPosts { [weak self] posts, err in
            guard let posts = posts else {
                self?.error.value = err
                return
            }
            
            self?.posts.value = posts
        }
    }
}
