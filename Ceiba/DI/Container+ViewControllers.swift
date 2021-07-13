//
//  Container+ViewControllers.swift
//  Ceiba
//
//  Created by Mario Rúa on 12/07/21.
//

import Foundation
import Swinject

extension Container {
    func registerViewControllers() {
        register(UserViewController.self) {r in UserViewController()}
            .initCompleted { (r, vc) in
                vc.viewModel = r.resolve(UserViewModelType.self)
            }
        
        register(PostsViewController.self) {r in PostsViewController()}
            .initCompleted { (r, vc) in
                vc.viewModel = r.resolve(PostViewModelType.self)
            }
    }
}

extension Container: ViewControllerFactory {
    func instantiateUserViewController() -> UserViewController {
        return resolve(UserViewController.self)!
    }
    
    func instantiatePostsViewController() -> PostsViewController {
        return resolve(PostsViewController.self)!
    }
}
