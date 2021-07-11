//
//  Container+Networking.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation
import Swinject

extension Container {
    func registerNetworkingClasses() {
        register(ApiManager.self) {_ in ApiManager()}
    }
}
