//
//  UserViewModel.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

internal protocol UserViewModelInputs {
    func getUsers()
}

internal protocol UserViewModelOutputs {
    var users: Dynamic<[User]?> { get }
    var error: Dynamic<Error?> { get }
}

internal protocol UserViewModelType {
    var inputs: UserViewModelInputs { get }
    var outputs: UserViewModelOutputs { get }
}

internal final class UserViewModel: UserViewModelType, UserViewModelInputs, UserViewModelOutputs
{
    var inputs: UserViewModelInputs { return self }
    var outputs: UserViewModelOutputs { return self }
    
    var users = Dynamic<[User]?>(nil)
    var error = Dynamic<Error?>(nil)
    
    let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func getUsers() {
        userRepository.getUsers { [weak self] users, err in
            guard let users = users else {
                self?.error.value = err
                return
            }
            
            self?.users.value = users
        }
    }
}
