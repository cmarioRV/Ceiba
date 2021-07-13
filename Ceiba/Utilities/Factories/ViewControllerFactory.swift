//
//  ViewControllerFactory.swift
//  Ceiba
//
//  Created by Mario Rúa on 12/07/21.
//

import Foundation

protocol ViewControllerFactory {
    func instantiateUserViewController() -> UserViewController
    func instantiatePostsViewController() -> PostsViewController
}
