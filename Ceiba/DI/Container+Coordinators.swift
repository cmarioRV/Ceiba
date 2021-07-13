//
//  Container+Coordinators.swift
//  Ceiba
//
//  Created by Mario Rúa on 10/07/21.
//

import Foundation
import Swinject

extension Container {
    func registerCoordinators() {
        register(AppCoordinator.self) {r in AppCoordinator(router: r.resolve(RouterProtocol.self)!, factory: self)}.inObjectScope(.container)
        register(UserCoordinator.self) {r in UserCoordinator(router: r.resolve(RouterProtocol.self)!, factory: self)}.inObjectScope(.container)
    }
    
    func start() {
        resolve(AppCoordinator.self)!.start()
    }
}

extension Container: CoordinatorFactoryProtocol {
    func instantiateUserCoordinator() -> UserCoordinator {
        return resolve(UserCoordinator.self)!
    }
    
    func instantiateAppCoordinator() -> AppCoordinator {
        return resolve(AppCoordinator.self)!
    }
}
