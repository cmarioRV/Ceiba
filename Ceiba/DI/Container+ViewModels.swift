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
        register(UserViewModelType.self) {r in UserViewModel(userRepository: r.resolve(UserRepository.self)!)}
        register(PostViewModelType.self) {r in PostViewModel(postRepository: r.resolve(PostRepository.self)!)}
    }
}
