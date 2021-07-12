//
//  Container+ViewModels.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation
import Swinject

extension Container {
    func registerViewModels() {
        register(UserViewModelType.self) {r in UserViewModel(userService: r.resolve(UserService.self)!, databaseService: r.resolve(DatabaseService.self)!)}
        register(PostViewModelType.self) {r in PostViewModel(postService: r.resolve(PostService.self)!)}
    }
}
