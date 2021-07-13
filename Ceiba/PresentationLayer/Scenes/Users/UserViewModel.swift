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
    func search(name: String)
}

internal protocol UserViewModelOutputs {
    var cellViewModels: Dynamic<[UserCellViewModel]> { get }
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
    
    var cellViewModels = Dynamic<[UserCellViewModel]>([UserCellViewModel]())
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
                
                guard let weakSelf = self else { return }
                
                guard let users = users else {
                    weakSelf.error.value = err
                    weakSelf.isBussy.value = false
                    return
                }
                
                weakSelf.databaseService.saveUsers(users)
                weakSelf.cellViewModels.value = weakSelf.buildCellViewModels(users)
            }
        } else {
            cellViewModels.value = buildCellViewModels(usersFetched)
        }
        
        isBussy.value = false
    }
    
    func search(name: String) {
        if name == "" {
            getUsers()
            return
        }
        if name.count <= 2 { return }
        if isBussy.value { return }
        isBussy.value = true
        cellViewModels.value = buildCellViewModels(databaseService.searchUser(name: name))
        isBussy.value = false
    }
    
    func getUsersFromDB() {
        cellViewModels.value = buildCellViewModels(databaseService.getUsers())
    }
    
    private func buildCellViewModels(_ users: [User]) -> [UserCellViewModel] {
        var viewModels = [UserCellViewModel]()
        
        for user in users {
            let cellViewModel = UserCellViewModel(userId: user.id, title: user.name, phone: user.phone ?? "", email: user.email)
            viewModels.append(cellViewModel)
        }
        
        return viewModels
    }
}
