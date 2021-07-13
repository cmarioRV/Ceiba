//
//  AppCoordinator.swift
//  Ceiba
//
//  Created by Mario Rúa on 9/07/21.
//

import Foundation

class AppCoordinator: BaseCoordinator {
    
    private let factory: Factory
    private let router: RouterProtocol
    
    init(router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        let coordinator = self.factory.instantiateUserCoordinator()
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.start()
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
}
