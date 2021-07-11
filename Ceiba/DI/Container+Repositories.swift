//
//  Container+Repositories.swift
//  Ceiba
//
//  Created by Mario Rúa on 10/07/21.
//

import Foundation
import Swinject

extension Container {
    func registerRepositories() {
        if(ProcessInfo.processInfo.environment["MOCKS"] != nil) {
            register(UserRepository.self) { r in MockUserRepository(apiManager: r.resolve(ApiManager.self)!)}
            register(PostRepository.self) {r in MockPostRepository(apiManager: r.resolve(ApiManager.self)!)}
        }
        else {
            register(UserRepository.self) { r in RemoteUserRepository(apiManager: r.resolve(ApiManager.self)!)}
            register(PostRepository.self) {r in RemotePostRepository(apiManager: r.resolve(ApiManager.self)!)}
        }
    }
}
