//
//  UserDao.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

class UserDao: BaseDao<User, UserEntity> {
    func findById(id: Int) -> User? {
        return super.fetch(predicate: NSPredicate(format: "id == %d", id)).last
    }
    
    func findAll() -> [User] {
        return super.fetch(predicate: nil, sorted: Sorted(key: "id", ascending: false))
    }
    
    func deleteById(id: Int) -> Void {
        guard let user = findById(id: id) else { return }
        
        do {
            try super.delete(object: user)
        } catch {
            return
        }
    }
}
