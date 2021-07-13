//
//  UserCoordinator.swift
//  Ceiba
//
//  Created by Mario Rúa on 12/07/21.
//

import Foundation

class UserCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    var finishFlow: (() -> Void)?
    
    private let router: RouterProtocol
    private let factory: Factory
    
    private func showUserViewController() {
        let userViewController = self.factory.instantiateUserViewController()
        userViewController.onShowPosts = { [unowned self] result in
            self.showPostViewController(userId: result)
        }
        self.router.setRootModule(userViewController, hideBar: false)
    }
    
    private func showPostViewController(userId: Int) {
        let postViewController = self.factory.instantiatePostsViewController()
        postViewController.userId = userId
        self.router.push(postViewController, animated: true)
    }
    
    override func start() {
        self.showUserViewController()
    }
    
    init(router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
    }
}
