//
//  PostViewModel.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

internal protocol PostViewModelInputs {
    func getPosts()
    func getPostsByUser(_ userId: Int)
}

internal protocol PostViewModelOutputs {
    var cellViewModels: Dynamic<[PostCellViewModel]> { get }
    var error: Dynamic<Error?> { get }
    var isBussy: Dynamic<Bool> { get }
}

internal protocol PostViewModelType {
    var inputs: PostViewModelInputs { get }
    var outputs: PostViewModelOutputs { get }
}

internal final class PostViewModel: PostViewModelType, PostViewModelInputs, PostViewModelOutputs
{
    var inputs: PostViewModelInputs { return self }
    var outputs: PostViewModelOutputs { return self }
    
    var error = Dynamic<Error?>(nil)
    var cellViewModels = Dynamic<[PostCellViewModel]>([PostCellViewModel]())
    var isBussy = Dynamic(false)
    
    let postService: PostService
    
    init(postService: PostService) {
        self.postService = postService
    }
    
    func getPosts() {
        if isBussy.value { return }
        isBussy.value = true
        postService.getPosts { [weak self] posts, err in
            
            guard let weakSelf = self else { return }
            
            guard let posts = posts else {
                weakSelf.error.value = err
                weakSelf.isBussy.value = false
                return
            }
            
            weakSelf.cellViewModels.value = weakSelf.buildCellViewModels(posts)
            weakSelf.isBussy.value = false
        }
    }
    
    func getPostsByUser(_ userId: Int) {
        if isBussy.value { return }
        isBussy.value = true
        postService.getPostsByUser(userId: userId) { [weak self] posts, err in
            
            guard let weakSelf = self else { return }
            
            guard let posts = posts else {
                self?.error.value = err
                weakSelf.isBussy.value = false
                return
            }
            
            weakSelf.cellViewModels.value = weakSelf.buildCellViewModels(posts)
            weakSelf.isBussy.value = false
        }
    }
    
    private func buildCellViewModels(_ posts: [Post]) -> [PostCellViewModel] {
        var viewModels = [PostCellViewModel]()
        
        for post in posts {
            let cellViewModel = PostCellViewModel(userId: post.userId, id: post.id, title: post.title, body: post.body)
            viewModels.append(cellViewModel)
        }
        
        return viewModels
    }
}
