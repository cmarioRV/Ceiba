//
//  BaseCoordinator.swift
//  Ceiba
//
//  Created by Mario Rúa on 9/07/21.
//

import Foundation

class BaseCoordinator: Coordinator {
    typealias Factory = CoordinatorFactoryProtocol & ViewControllerFactory
    
    var childCoordinators = [Coordinator]()
    
    func addDependency(_ coordinator: Coordinator) {
        for element in childCoordinators {
            if element === coordinator { return }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
        
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func start() {
        
    }
}
