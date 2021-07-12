//
//  UserViewModel.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

internal protocol UserViewModelInputs {
    func getUsers()
    func getUsersFromDB()
    func saveUser(_ user: User)
}

internal protocol UserViewModelOutputs {
    var users: Dynamic<[User]?> { get }
    var error: Dynamic<Error?> { get }
    var isBussy: Dynamic<Bool> { get }
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
    var isBussy = Dynamic(false)
    
    let userService: UserService
    let databaseService: DatabaseService
    
    init(userService: UserService, databaseService: DatabaseService) {
        self.userService = userService
        self.databaseService = databaseService
    }
    
    func saveUser(_ user: User) {
        databaseService.saveUser(user: user)
    }
    
    func getUsers() {
        if isBussy.value { return }
        isBussy.value = true
        
        let usersFetched = databaseService.getUsers()
        if(usersFetched.count == 0) {
            userService.getUsers { [weak self] users, err in
                guard let users = users else {
                    self?.error.value = err
                    self?.isBussy.value = false
                    return
                }
                
                self?.databaseService.saveUsers(users)
                self?.users.value = users
            }
        } else {
            users.value = usersFetched
        }
        
        isBussy.value = false
    }
    
    func getUsersFromDB() {
        users.value = databaseService.getUsers()
    }
}
