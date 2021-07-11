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
        register(AppCoordinator.self) {_ in AppCoordinator()}
    }
}
