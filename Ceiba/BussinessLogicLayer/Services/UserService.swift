//
//  UserService.swift
//  Ceiba
//
//  Created by Mario Rúa on 10/07/21.
//

import Foundation

class UserService {
    let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func getUsers(completion: @escaping([User]?, Error?) -> Void) {
        repository.getUsers(completion)
    }
}
