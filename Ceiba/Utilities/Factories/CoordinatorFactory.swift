//
//  CoordinatorFactory.swift
//  Ceiba
//
//  Created by Mario Rúa on 12/07/21.
//

import Foundation

protocol CoordinatorFactoryProtocol {
    func instantiateAppCoordinator() -> AppCoordinator
    func instantiateUserCoordinator() -> UserCoordinator
}
