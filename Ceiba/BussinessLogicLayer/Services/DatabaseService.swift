//
//  DatabaseService.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

class DatabaseService {
    func saveUser(user: User) {
        do {
            try DatabaseManager.shared.userDao.save(object: user)
        } catch {
            print(error.localizedDescription)
            return
        }
    }
    
    func saveUsers(_ users: [User]) {
        do {
            try DatabaseManager.shared.userDao.saveAll(objects: users)
        } catch {
            print(error.localizedDescription)
            return
        }
    }
    
    func getUser(id: Int) -> User? {
        return DatabaseManager.shared.userDao.findById(id: id)
    }
    
    func getUsers() -> [User] {
        DatabaseManager.shared.userDao.findAll()
    }
    
    func deleteUser(id: Int) {
        DatabaseManager.shared.userDao.deleteById(id: id)
    }
    
    func deleteAllUsers() {
        do {
            try DatabaseManager.shared.userDao.deleteAll()
        } catch {
            print(error.localizedDescription)
            return
       }
    }
    
    func savePost(post: Post) {
        do {
            try DatabaseManager.shared.postDao.save(object: post)
        } catch {
            print(error.localizedDescription)
            return
        }
    }
    
    func getPost(id: Int) -> Post? {
        return DatabaseManager.shared.postDao.findById(id: id)
    }
    
    func deletePost(id: Int) {
        DatabaseManager.shared.postDao.deleteById(id: id)
    }
    
    func deleteAllPosts() {
        do {
            try DatabaseManager.shared.postDao.deleteAll()
        } catch {
            print(error.localizedDescription)
            return
       }
    }
}
