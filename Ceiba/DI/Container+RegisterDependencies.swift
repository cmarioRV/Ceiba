//
//  DependencyRegistration.swift
//  Ceiba
//
//  Created by Mario Rúa on 10/07/21.
//

import Foundation
import UIKit
import Swinject

extension Container {
    func registerDependencies(rootViewController: UINavigationController) {
        registerCoordinators()
        registerNetworkingClasses()
        registerRepositories()
        registerServices()
        registerViewModels()
        registerViewControllers()
        registerRouter(root: rootViewController)
    }
}
