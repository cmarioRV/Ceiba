//
//  Container+Services.swift
//  Ceiba
//
//  Created by Mario Rúa on 10/07/21.
//

import Foundation
import Swinject

extension Container {
    func registerServices() {
        register(UserService.self) {r in UserService(repository: r.resolve(UserRepository.self)!)}
        register(PostService.self) {r in PostService(repository: r.resolve(PostRepository.self)!)}
        register(DatabaseService.self) {_ in DatabaseService()}
    }
}
