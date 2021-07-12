//
//  PostDao.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

class PostDao: BaseDao<Post, PostEntity> {

    func findById(id: Int) -> Post? {
        return super.fetch(predicate: NSPredicate(format: "id == %d", id)).last
    }
    
    func findAll() -> [Post] {
        return super.fetch(predicate: nil, sorted: Sorted(key: "id", ascending: false))
    }
    
    func deleteById(id: Int) -> Void {
        guard let post = findById(id: id) else { return }
        
        do {
            try super.delete(object: post)
        } catch {
            return
        }
    }
    
    func findPostByUserId(id: Int) -> [Post]? {
        return super.fetch(predicate: NSPredicate(format: "userId == %d", id), sorted: Sorted(key: "id", ascending: true))
    }
}
