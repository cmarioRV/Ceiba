//
//  Container+Router.swift
//  Ceiba
//
//  Created by Mario Rúa on 12/07/21.
//

import Foundation
import UIKit
import Swinject

extension Container {
    func registerRouter(root: UINavigationController) {
        register(RouterProtocol.self) {_ in Router(rootController: root)}
    }
}
